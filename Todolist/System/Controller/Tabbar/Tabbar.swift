//
//  Tabbar.swift
//  Todolist
//
//  Created by Abhi's Computers on 07/03/24.
//

import UIKit


class Tabbar: UITabBarController, TaskCreationDelegate {
    
    
    
    let centerButton = UIButton(type: .custom)
    let buttonSize: CGFloat = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        centerButton.frame.size = CGSize(width: 70, height: 70)
                centerButton.center = CGPoint(x: tabBar.bounds.width / 2, y: tabBar.bounds.height - tabBar.safeAreaInsets.bottom - buttonSize / 2 - 45)
       // centerButton.backgroundColor = UIColor.butcolor
        centerButton.layer.cornerRadius = 32
        centerButton.setImage(UIImage(named: "Group"), for: .normal)
        
        centerButton.addTarget(self, action: #selector(centerButtonAction(_:)), for: .touchUpInside)
                tabBar.addSubview(centerButton)

               
        
    }
    
    func taskDidCreate() {
        let vc = viewControllers?.first as! HomeVC
        vc.didloadSetup()
    }
    
    @objc func centerButtonAction(_ sender: UIButton) {
           
        let prsentvc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(identifier: "AddTaskPopup") as! AddTaskPopup
        prsentvc.modalTransitionStyle = .coverVertical
        prsentvc.modalPresentationStyle = .overCurrentContext
        prsentvc.taskCreationDelegate = self
        self.present(prsentvc, animated:true)
        
       }
    
}
