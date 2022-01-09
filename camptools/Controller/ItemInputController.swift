//
//  ItemInputController.swift
//  camptools
//  
//  Created by  on 2021/11/14
//  
//
                                
import UIKit

class ItemInputController: UIViewController {
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
    @IBOutlet weak var MemoTextField: TextField!
    var name: String?
    var mamo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nameInput(_ sender: UITextField) {
        addButtonLabel.tintColor = UIColor.white
        name = sender.text
        
    }
    
    @IBAction func memoInput(_ sender: UITextField) {
        mamo = sender.text
    }
    
    @IBAction func handleClickAddItem(_ sender: Any) {
        
    }
}
