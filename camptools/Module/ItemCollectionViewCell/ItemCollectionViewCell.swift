//
//  ItemCollectionViewCell.swift
//  camptools
//
//  Created by 北洞亜也加 on 2021/09/18.
//

import UIKit
import RealmSwift

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 6
            imageView.layer.borderColor = UIColor.systemGray5.cgColor
            imageView.layer.borderWidth = 1
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(model: ItemModel) {
        itemLabel.text = model.name
        if let image = model.image, let imageData = FileImage.getUIImageFromDocumentsDirectory(fileName: image) {
            imageView.image = imageData
        }
    }
}
