//
//  Helper.swift
//  Todolist
//
//  Created by Abhi's Computers on 01/03/24.
//

import Foundation
import UIKit


@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat {
           set {
               layer.borderWidth = newValue
           }
           get {
               return layer.borderWidth
           }
       }
    
    @IBInspectable var Cornerredies: CGFloat {
           set {
               layer.cornerRadius = newValue
           }
           get {
               return layer.cornerRadius
           }
       }
}

