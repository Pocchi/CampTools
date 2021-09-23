//
//  ItemCollectionViewCell.swift
//  camptools
//
//  Created by 北洞亜也加 on 2021/09/18.
//

import UIKit
import RealmSwift

class ItemCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(model: ItemModel) {
        self.backgroundColor = .lightGray
    }
}
