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
    
    @IBOutlet weak var MemoTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
