//
//  CollectionViewCell.swift
//  camptools
//  
//  Created by  on 2021/09/23
//  
//
import UIKit
import RealmSwift
import RxSwift
import RxRealm

final class ItemCollectionViewDataSource: NSObject {
    var items: [ItemModel] = []
    let disposeBag = DisposeBag()
}

extension ItemCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)

        if let cell = cell as? ItemCollectionViewCell {
            cell.setupCell(model: items[indexPath.row])
        }
        return cell
    }
}

extension ItemCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
