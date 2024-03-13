//
//  TimepickerPopup.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit


class TimepickerPopup: UIViewController {
    
    
    @IBOutlet weak var tapgestureView: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var TimepickerView: UIView!
    
    var datepopDissmiss: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TimepickerView.layer.cornerRadius = 15
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapTodismiss(_:)))
        tapgestureView.addGestureRecognizer(tap)
        
    }
    
    @objc func tapTodismiss (_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
  
    
    @IBAction func SaveButton(_ sender: UIButton) {
        
        let time = timePicker.date
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        let Time = formatter.string(for: time)
                
               
        self.dismiss(animated: true)
        datepopDissmiss!(Time!)

        
        }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true) 
    }
    

}
