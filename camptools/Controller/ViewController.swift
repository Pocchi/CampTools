//
//  ViewController.swift
//  camptools
//
//  Created by  on 2021/09/12.
//

import UIKit
import RealmSwift
import RxSwift
import RxRealm

class ViewController: UIViewController {

    let items = ItemModel.getAll()
    let viewModel = ItemCollectionViewModel()
    let disposeBag = DisposeBag()
    let showItem = PublishSubject<ItemModel>()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        }
    }
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionViewFlowLayout.estimatedItemSize = CGSize(width: self.collectionView.frame.width / 2, height: self.collectionView.frame.height / 4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print("選択しました: \(indexPath.row)")
    }

    private let dataSource = ItemCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: デバックコード あとで消す
        print("Realm file-----")
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
        collectionView.collectionViewLayout = layout
        
        viewModel.ViewDidLoad()
        dataSource.items = viewModel.items.value
        
        if let itemModel = items {
            Observable.changeset(from: itemModel)
              .subscribe(onNext: { [weak self] results, changes in
                  guard let self = self, changes != nil else { return }
                  print(results)
                  self.dataSource.items = self.viewModel.items.value
                  self.collectionView.reloadData()
              })
              .disposed(by: disposeBag)
        }
    }
}
