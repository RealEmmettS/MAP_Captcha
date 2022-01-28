//
//  Extensions.swift
//  Captcha
//
//  Created by Emmett Shaughnessy on 1/28/22.
//

import Foundation
import UIKit


//MARK: UIImageView
extension UIImageView{
    
    func shake() {
           let animation = CABasicAnimation(keyPath: "position")
           
           animation.duration     = 0.05
           animation.repeatCount  = 3
           animation.autoreverses = true
           animation.fromValue    = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
           animation.toValue      = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
           
           self.layer.add(animation, forKey: "position")
       }//end of shake()
    
}
