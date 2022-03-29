//
//  ItemCollectionViewCell.swift
//  camptools
//
//  Created by 北洞亜也加 on 2021/09/18.
//

import UIKit
import RealmSwift
import RxSwift

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 6
            imageView.layer.borderColor = UIColor.systemGray5.cgColor
            imageView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var mainView: UIView!
    private let disposeBag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(model: ItemModel) {
        itemLabel.text = model.name
        if let image = model.image, let imageData = FileImage.getUIImageFromDocumentsDirectory(fileName: image) {
            imageView.image = imageData
        }
        bindingRx()
    }
    
    private func bindingRx() {
        let cellTapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        mainView.addGestureRecognizer(cellTapGesture)
        
        cellTapGesture.rx.event.bind(onNext: { [weak self] _ in
        }).disposed(by: disposeBag)
    }
}
