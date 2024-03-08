//
//  DatePickerpopUp.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit

class DatePickerpopUp: UIViewController {
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.popupView.layer.cornerRadius = 15
    }
    
  
    
    @IBAction func chooseTimeButton(_ sender: UIButton) {
        
//        self.dismiss(animated: true)
            
        let PresentVC = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(identifier: "TimepickerPopup") as! TimepickerPopup
            
            PresentVC.modalTransitionStyle = .coverVertical
            PresentVC.modalPresentationStyle = .overCurrentContext
            
            self.present(PresentVC, animated: true, completion: nil)
            
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
