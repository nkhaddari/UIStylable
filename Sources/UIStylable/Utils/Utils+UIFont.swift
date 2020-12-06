//
//  Utils+UIFont.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 06/12/2020.
//

import UIKit

extension UIFont {
    var bold: UIFont { with(traits: .traitBold) }
    
    var italic: UIFont { with(traits: .traitItalic) }
    
    var boldItalic: UIFont { with(traits: [.traitBold, .traitItalic]) }
    
    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else { return self }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
