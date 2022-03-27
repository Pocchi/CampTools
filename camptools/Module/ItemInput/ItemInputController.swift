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

class ItemInputController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageWrapView: UIView!
    @IBOutlet weak var imageView: UIImageView!
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
   
    private var imageFile: String? = ""
    
    
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
        
        let imageTapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        imageWrapView.addGestureRecognizer(imageTapGesture)
        
        imageTapGesture.rx.event.bind(onNext: { [weak self] _ in
            self?.selectImageFile()
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
    
    @IBAction func selectImage(_ sender: Any) {
        selectImageFile()
    }
    func selectImageFile() {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            self.present(pickerView, animated: true)
        } else {
            let alert = UIAlertController(title: "", message: "カメラロールにアクセスできません", preferredStyle: .alert)
            let closeButton = UIAlertAction(title: "閉じる", style: .default, handler: nil)
            alert.addAction(closeButton)
            // アラート表示
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func handleClickCancel(_ sender: Any) {
        // 前に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleClickAddItem(_ sender: Any) {
        if nameTextField.text == nil {
            return
        }
        if ItemModel.create(name: nameTextField.text!, memo: memoTextView.text, image: imageFile) != nil {
            // 前に戻る
            self.dismiss(animated: true, completion: nil)
        } else {
            // 更新失敗ダイアログ
            Dialog.alert(title: "アラート", message: "メッセージ", parent: self)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        imageFile = FileImage.saveImage(image: image)
        self.dismiss(animated: true)
    }
}
