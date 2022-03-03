//
//  UITextView.swift
//  camptools
//  
//  Created by  on 2021/11/14
//  
//

import UIKit

class TextField: UITextField {
    override func awakeFromNib() {
        self.layer.cornerRadius = 0
    }
    
    func borderBottom() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(border)
    }
}
