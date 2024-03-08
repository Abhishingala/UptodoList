//
//  AddTaskPopup.swift
//  Todolist
//
//  Created by Abhi's Computers on 07/03/24.
//

import UIKit

class AddTaskPopup: UIViewController {

    @IBOutlet weak var PopupView: UIView!
    
    @IBOutlet weak var tasktextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PopupView.layer.cornerRadius = 10
        tasktextField.layer.borderColor = UIColor.systemGray3.cgColor
        tasktextField.layer.borderWidth = 1
        tasktextField.layer.cornerRadius = 5
        
    }
    
    @IBAction func timerButton(_ sender: Any) {
        
        let Presentvc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "DatePickerpopUp")
        
      
        Presentvc.modalPresentationStyle = .overCurrentContext
        Presentvc.modalTransitionStyle = .crossDissolve
        
        self.present(Presentvc, animated: true)
        
    }
    

}
