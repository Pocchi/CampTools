//
//  ItemInputController.swift
//  camptools
//  
//  Created by  on 2021/11/14
//  
//

import RxCocoa
import RxSwift
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
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.delegate = self
        bindingRx()
    }
    
    private func bindingRx() {
        // nameが入力されたらdisabledカラーをはずす
        nameTextField.rx
            .text.subscribe(onNext: { [weak self] text in
                if text == nil || text == "" {
                    self?.addButtonLabel.tintColor = UIColor.init(named: "disabledText")
                } else {
                    self?.addButtonLabel.tintColor = UIColor.white
                }
            }).disposed(by: disposeBag)
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
