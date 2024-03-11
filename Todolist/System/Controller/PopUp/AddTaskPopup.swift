//
//  AddTaskPopup.swift
//  Todolist
//
//  Created by Abhi's Computers on 07/03/24.
//

import UIKit

protocol TaskCreationDelegate {
    func taskDidCreate()
}


class AddTaskPopup: UIViewController , Delegate, categaory{
    
    

    @IBOutlet weak var tapgestureView: UIView!
    @IBOutlet weak var PopupView: UIView!
    @IBOutlet weak var tasktextField: UITextField!
    
    
     var taskCreationDelegate: TaskCreationDelegate?

    var taskdate = String()
    var tasktime = String()
    var taskcategory = String()
    
    static var Share = AddTaskPopup()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PopupView.layer.cornerRadius = 10
        self.PopupView.layer.backgroundColor = UIColor.bg.cgColor
        tasktextField.layer.borderColor = UIColor.systemGray3.cgColor
        tasktextField.layer.borderWidth = 1
        tasktextField.layer.cornerRadius = 5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TaptodismissPopup(_:)))
        self.tapgestureView.addGestureRecognizer(tap)
        
    }
    @IBAction func sendButton(_ sender: UIButton) {
        
        if tasktextField.text?.isEmpty == true {
            self.showToast(message: "Entar task name", duration:  1.5)
            print("Please fiest entar the text")
        }
        else {
            
            if taskdate.isEmpty == true && tasktime.isEmpty == true {
                self.showToast(message: "Select Date of Time", duration:  1.5)
                print("Plesae select date of time")
            }
                else {
                    
                    if taskcategory.isEmpty == true {
                        self.showToast(message: "Select Category", duration: 1.5)
                        print("PLease first selsct category")
                      
                    }
                    else {
                        TodolistDataModel.Shared.settaskname(taskname: tasktextField.text!, tasktime: tasktime, taskcategoryimg: taskcategory, isTaskCompleted: false, taskdate: taskdate)
                        self.dismiss(animated: true) {
                            self.taskCreationDelegate?.taskDidCreate()
                        }
                  
                    }
                }
            }
        }
    
    
    @IBAction func timerButton(_ sender: UIButton) {
        
        let Presentvc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "DatePickerpopUp") as! DatePickerpopUp
        Presentvc.modalPresentationStyle = .overCurrentContext
        Presentvc.modalTransitionStyle = .crossDissolve
        Presentvc.delegateDate = self
        self.present(Presentvc, animated: true)
        
    }
    
    @IBAction func categoryButton(_ sender: Any) {
        
        let presentVC = UIStoryboard(name: "Tabbar", bundle: nil
        ).instantiateViewController(identifier: "ChooseCategory") as! ChooseCategory
        
        presentVC.modalTransitionStyle = .crossDissolve
        presentVC.modalPresentationStyle = .overCurrentContext
        presentVC.delegatecategaory = self
        
        self.present(presentVC, animated: true)
        
        
    }
   
   // tapgestureView.isUserInteractionEnabled = true

    @objc func TaptodismissPopup (_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    
    
  
}

extension AddTaskPopup {
    
   
    func DatePass(date: String, time: String) {
        taskdate = date
        tasktime = time
//        print(taskdate , tasktime)
    }
    func categaorypass(category: String) {
        taskcategory = category
    }
    
  
    
    
}

