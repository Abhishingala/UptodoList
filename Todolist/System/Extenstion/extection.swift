//
//  extection.swift
//  Todolist
//
//  Created by Abhi's Computers on 10/03/24.
//

import Foundation
import UIKit


extension UIViewController {
   

    
        func showToast(message: String, duration: TimeInterval) {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
            toastLabel.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
            toastLabel.textColor = UIColor.systemGray2
            toastLabel.textAlignment = .center;
            toastLabel.font = UIFont.systemFont(ofSize: 16)
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            
            UIView.animate(withDuration: duration, delay: 0.5, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        }
    }


