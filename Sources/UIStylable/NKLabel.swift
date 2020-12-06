//
//  File.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 06/12/2020.
//

import UIKit

@IBDesignable
class NKLabel: UILabel, UIStylable {
    
    @IBInspectable
    open var styleName: String! {
        didSet {
            if oldValue == nil || oldValue != styleName {
                readStyle()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius  = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 0
    @IBInspectable var fontName: String? {
        didSet {
            if self.fontSize == 0 {
                font   =   UIFont(name: fontName!, size: font.pointSize)
            } else {
                font   =   UIFont(name: fontName!, size: fontSize)
            }
        }
    }
    
    @IBInspectable var isBold: Bool = false {
        didSet {
            if isBold {
                font = font.bold
            }
        }
    }
    
    func readStyle() {
        if let style = StyleManager.shared.find(byName: styleName) as? LabelStyle {
            initProperties(withStyle: style)
        } else {
            print("Could not load style named \(styleName!)")
        }
    }
    func initProperties(withStyle style: LabelStyle) {
        self.backgroundColor = style.backgroundColor
        self.textColor = style.textColor
        
        if let isCircleCornerRadius = style.isCircleCornerRadius, isCircleCornerRadius {
            self.cornerRadius = frame.size.height / 2
            
        } else if let cornerRadius = style.cornerRadius {
            self.cornerRadius = cornerRadius
        }
        
        if let borderWidth = style.borderWidth {
            self.borderWidth = borderWidth
        }
        
        self.fontSize = style.fontSize ?? 15
        self.fontName = style.fontName
        
        if let isBold = style.isBold, isBold {
            self.isBold = isBold
        }
        
        self.setNeedsDisplay()
    }
}
