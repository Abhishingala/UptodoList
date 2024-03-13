//
//  TaskedittitleVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 11/03/24.
//

import UIKit

class TaskedittitleVC: UIViewController {

    @IBOutlet weak var textfieldView: UIView!
    @IBOutlet weak var tapgestureview: UIView!
    @IBOutlet weak var textfield: UITextField!
    
    var index = 0
    var text = ""
    var dataUpdate: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textfield.text = text
        self.textfieldView.layer.borderColor = UIColor.systemGray2.cgColor
        self.textfieldView.layer.borderWidth = 1
        self.textfieldView.layer.cornerRadius = 8
        let tap = UITapGestureRecognizer(target: self, action: #selector(taptodismiss(_:)))
        self.tapgestureview.addGestureRecognizer(tap)
        
    }
    @IBAction func savebutton(_ sender: UIButton) {
        
        
        self.dismiss(animated: true) {
            self.dataUpdate?( self.textfield.text!)
        }
        
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func taptodismiss (_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }


}
