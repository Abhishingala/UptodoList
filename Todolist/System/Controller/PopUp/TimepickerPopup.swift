//
//  TimepickerPopup.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit

class TimepickerPopup: UIViewController {
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var TimepickerView: UIView!
    
    var datepopDissmiss: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TimepickerView.layer.cornerRadius = 15
        
    }
    
  
    
    @IBAction func SaveButton(_ sender: UIButton) {
        
        let time = timePicker.date
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        let Time = formatter.string(for: time)
                
        TodolistDataModel.Shared.settasktime(tasktime: Time!)
        
        self.dismiss(animated: true)
        datepopDissmiss!()

        
        }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true) 
    }
    

}
