//
//  DatePickerpopUp.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit

protocol Delegate {
    func DatePass (date: String, time: String)
}

class DatePickerpopUp: UIViewController {
    
    @IBOutlet weak var tagGestureView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var datepicker: UIDatePicker!
    var delegateDate: Delegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popupView.layer.cornerRadius = 15
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapTodismiss(_:)))
        tagGestureView.addGestureRecognizer(tap)
    }
    
 
    @objc func tapTodismiss (_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    
    
    @IBAction func chooseTimeButton(_ sender: UIButton) {
        
        let selectedDate = datepicker.date
        let dataformat = DateFormatter()
        dataformat.dateFormat = "dd/MM/yyyy"
        let date = dataformat.string(from: selectedDate)
       
        //print(date)
      //  TodolistDataModel.Shared.settaskdate(taskdate: date)
        
        let PresentVC = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(identifier: "TimepickerPopup") as! TimepickerPopup
            
            PresentVC.modalTransitionStyle = .coverVertical
            PresentVC.modalPresentationStyle = .overCurrentContext
        
        PresentVC.datepopDissmiss = { [self] time in
            delegateDate.DatePass(date: date, time: time)
            
            self.dismiss(animated: true)
            
        }
            self.present(PresentVC, animated: true, completion: nil)
            
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
