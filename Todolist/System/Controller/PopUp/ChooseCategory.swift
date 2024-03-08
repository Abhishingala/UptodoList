//
//  ChooseCategory.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit

class ChooseCategory: UIViewController {

    @IBOutlet weak var addCategoryButoon: UIButton!
    
    @IBOutlet var categoryButton: [UIButton]!
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addCategoryButoon.layer.cornerRadius = 10
       
    }
    
    
    @IBAction func categorybut(_ sender: UIButton) {
        
         index = sender.tag
        
        for button in categoryButton {
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0
        }
        
        sender.layer.borderColor = UIColor.white.cgColor
        sender.layer.borderWidth = 3
        
        
    }
    
    @IBAction func addCategory(_ sender: UIButton) {
        
        
        TodolistDataModel.Shared.settaskcategoryimg(taskcategoryimg: String(index))
        print(URL.documentsDirectory)
//        self.dismiss(animated: true)
    }
    
}