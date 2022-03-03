//
//  CollectionViewCell.swift
//  camptools
//  
//  Created by  on 2021/09/23
//  
//
import UIKit
import RealmSwift

final class ItemCollectionViewDataSource: NSObject {
    var itemList: Results<ItemModel>!
}

extension ItemCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)

        if let cell = cell as? ItemCollectionViewCell {
            cell.setupCell(model: itemList[indexPath.row])
        }

        return cell
        
    }
}
