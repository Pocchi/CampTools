//
//  ItemShowController.swift
//  camptools
//  
//  Created by  on 2022/03/27
//  
//

import RxCocoa
import RxSwift
import UIKit

class ItemShowController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(model: ItemModel) {
        if let image = model.image, let imageData = FileImage.getUIImageFromDocumentsDirectory(fileName: image) {
            imageView.image = imageData
        }
    }
}
