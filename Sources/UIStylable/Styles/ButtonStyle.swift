//
//  ButtonStyle.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 08/12/2020.
//

import UIKit

open class ButtonStyle {
    
    var identifier: String?
    var backgroundNormalColor: UIColor?
    var backgroundHighlightedColor: UIColor?
    var backgroundDisabledColor: UIColor?
    var titleNormalColor: UIColor?
    var titleHighlightedColor: UIColor?
    var titleDisabledColor: UIColor?
    var borderNormalColor: UIColor?
    var borderHighlightedColor: UIColor?
    var borderDisabledColor: UIColor?
    var borderWidth: CGFloat? = 0
    var cornerRadius: CGFloat? = 0
    var fontName: String? = ""
    var fontSize: CGFloat? = 0
    var height: CGFloat? = 0
    
    init(identifier: String? = nil, backgroundNormalColor: UIColor? = nil,
         backgroundHighlightedColor: UIColor? = nil, backgroundDisabledColor: UIColor? = nil,
         titleNormalColor: UIColor? = nil, titleHighlightedColor: UIColor? = nil,
         titleDisabledColor: UIColor? = nil, borderNormalColor: UIColor? = nil,
         borderHighlightedColor: UIColor? = nil, borderDisabledColor: UIColor? = nil,
         borderWidth: CGFloat? = 0, cornerRadius: CGFloat? = 0,
         fontName: String? = "", fontSize: CGFloat? = 0,
         height: CGFloat? = 0) {
        self.identifier = identifier
        self.backgroundNormalColor = backgroundNormalColor
        self.backgroundHighlightedColor = backgroundHighlightedColor
        self.backgroundDisabledColor = backgroundDisabledColor
        self.titleNormalColor = titleNormalColor
        self.titleHighlightedColor = titleHighlightedColor
        self.titleDisabledColor = titleDisabledColor
        self.borderNormalColor = borderNormalColor
        self.borderHighlightedColor = borderHighlightedColor
        self.borderDisabledColor = borderDisabledColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.fontName = fontName
        self.fontSize = fontSize
        self.height = height
    }
    
    convenience init(identifier: String? = nil, properties: [String: Any]) {
        let backgroundNormalColor           =   UIColor(named: properties["backgroundNormalColor"] as? String ?? "")
        let backgroundHighlightedColor      =   UIColor(named: properties["backgroundHighlightedColor"] as? String ?? "")
        let backgroundDisabledColor         =   UIColor(named: properties["backgroundDisabledColor"] as? String ?? "")
        
        let titleNormalColor                =   UIColor(named: properties["titleNormalColor"] as? String ?? "")
        let titleHighlightedColor           =   UIColor(named: properties["titleHighlightedColor"] as? String ?? "")
        let titleDisabledColor              =   UIColor(named: properties["titleDisabledColor"] as? String ?? "")
        
        let borderNormalColor               =   UIColor(named: properties["borderNormalColor"] as? String ?? "")
        let borderHighlightedColor          =   UIColor(named: properties["borderHighlightedColor"] as? String ?? "")
        let borderDisabledColor             =   UIColor(named: properties["borderDisabledColor"] as? String ?? "")
        
        let borderWidth                     =   properties["borderWidth"] as? CGFloat
        let cornerRadius                    =   properties["cornerRadius"] as? CGFloat
        
        let fontName                        =   properties["fontName"] as? String
        let fontSize                        =   properties["fontSize"] as? CGFloat
        
        let height                          =   properties["height"] as? CGFloat
        self.init(identifier: identifier, backgroundNormalColor: backgroundNormalColor,
                  backgroundHighlightedColor: backgroundHighlightedColor, backgroundDisabledColor: backgroundDisabledColor,
                  titleNormalColor: titleNormalColor, titleHighlightedColor: titleHighlightedColor,
                  titleDisabledColor: titleDisabledColor, borderNormalColor: borderNormalColor,
                  borderHighlightedColor: borderHighlightedColor,borderDisabledColor: borderDisabledColor,
                  borderWidth: borderWidth, cornerRadius: cornerRadius,
                  fontName: fontName, fontSize: fontSize, height: height)
    }
}
