//
//  ItemInputController.swift
//  camptools
//  
//  Created by  on 2021/11/14
//  
//
                                
import UIKit

class ItemInputController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var TextInputStackView: TextStackView! {
        didSet {
            TextInputStackView.borderY()
        }
    }
    @IBOutlet weak var nameTextField: TextField! {
        didSet {
            nameTextField.borderBottom()
        }
    }
    @IBOutlet weak var addButtonLabel: UIBarButtonItem! {
        didSet {
            addButtonLabel.tintColor = UIColor.init(named: "disabledText")
        }
    }
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var memoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.delegate = self
    }

    @IBAction func nameInput(_ sender: UITextField) {
        // nameが入力されたらdisabledカラーをはずす
        if nameTextField.text == nil {
            addButtonLabel.tintColor = UIColor.init(named: "disabledText")
        } else {
            addButtonLabel.tintColor = UIColor.white
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // textViewのプレースホルダを非表示にする
        if textView.text.count > 0 {
            memoLabel.isHidden = true
        } else {
            memoLabel.isHidden = false
        }
    }
    
    @IBAction func handleClickAddItem(_ sender: Any) {
        if nameTextField.text == nil {
            return
        }
        print(memoTextView.text)
        print(nameTextField.text)
    }
}
