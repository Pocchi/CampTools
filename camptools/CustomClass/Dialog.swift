//
//  Dialog.swift
//  camptools
//  
//  Created by  on 2022/02/05
//  
//

import Foundation
import UIKit

class Dialog: NSObject {
    
    class func alert(title: String?, message: String?, parent: UIViewController) {
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        parent.present(dialog, animated: true, completion: nil)
    }
}
