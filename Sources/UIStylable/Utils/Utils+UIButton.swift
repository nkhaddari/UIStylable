//
//  Utils+UIButton.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 08/12/2020.
//

import UIKit

extension UIButton {
    func setBackgroundColor(color: UIColor, forState state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: state)
    }
    
}
