//
//  LabelStyle.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 06/12/2020.
//

import UIKit

open class LabelStyle {
    
    var identifier: String?
    var backgroundColor: UIColor?
    var textColor: UIColor?
    var borderColor: UIColor?
    var borderWidth: CGFloat? = 0
    var cornerRadius: CGFloat? = 0
    var isCircleCornerRadius: Bool?

    var isBold: Bool?

    var fontName: String? = ""
    var fontSize: CGFloat? = 0
    
    init(identifier: String? = nil, backgroundColor: UIColor? = nil,
         textColor: UIColor?, borderColor: UIColor?, borderWidth: CGFloat? = 0,
         cornerRadius: CGFloat? = 0, isCircleCornerRadius: Bool? = false,
         isBold: Bool? = false, fontName: String? = "", fontSize: CGFloat? = 0) {
        self.identifier = identifier
        self.backgroundColor            =   backgroundColor
        self.textColor                  =   textColor
        self.borderColor                =   borderColor
        self.cornerRadius               =   cornerRadius
        self.borderWidth                =   borderWidth
        self.fontName                   =   fontName
        self.fontSize                   =   fontSize
        self.isCircleCornerRadius       = isCircleCornerRadius
        self.isBold                     = isBold
    }
    
    convenience init(identifier: String? = nil, properties: [String: Any]) {
        let backgroundColor             =   UIColor(named: properties["backgroundColor"] as? String ?? "")
        let textColor                   =   UIColor(named: properties["textColor"] as? String ?? "")
        let borderColor                 =   UIColor(named: properties["borderColor"] as? String ?? "")
        let borderWidth                 =   properties["borderWidth"] as? CGFloat
        let cornerRadius                =   properties["cornerRadius"] as? CGFloat
        let fontName                    =   properties["fontName"] as? String
        let fontSize                    =   properties["fontSize"] as? CGFloat
        let isCircleCornerRadius        = properties["isCircleCornerRadius"] as? Bool
        let isBold                      = properties["isBold"] as? Bool
        
        self.init(identifier: identifier, backgroundColor: backgroundColor,
                  textColor: textColor, borderColor: borderColor,
                  borderWidth: (borderWidth == nil ? 0 : borderWidth),
                  cornerRadius: (cornerRadius == nil ? 0 : cornerRadius),
                  isCircleCornerRadius: isCircleCornerRadius,
                  isBold: isBold, fontName: fontName, fontSize: fontSize)
    }
}
