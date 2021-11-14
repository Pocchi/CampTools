//
//  ViewController.swift
//  camptools
//
//  Created by  on 2021/09/12.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let itemList = ItemModel.getAll()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = dataSource
            dataSource.itemList = itemList
            collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        }
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
 
    }

    
}
