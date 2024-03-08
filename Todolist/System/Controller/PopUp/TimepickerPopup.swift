//
//  TimepickerPopup.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit

class TimepickerPopup: UIViewController {

    @IBOutlet weak var TimepickerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TimepickerView.layer.cornerRadius = 15
        
    }
    

    @IBAction func SaveButton(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
        }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
