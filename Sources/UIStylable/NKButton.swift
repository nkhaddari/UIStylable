//
//  NKButton.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 08/12/2020.
//

import UIKit
open class NKButton: UIButton, UIStylable {
    var styleName: String! {
        didSet {
            if oldValue == nil || oldValue != styleName {
                loadStyle()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            applyNormalColors(sender: self)
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            if isSelected {
                applyHighlightColors(sender: self)
            } else {
                applyNormalColors(sender: self)
            }
        }
    }
    
    //MARK: - Background
    @IBInspectable var backgroundNormalColor: UIColor? = .clear {
        didSet {
            setBackgroundColor(color: backgroundNormalColor!, forState: .normal)
        }
    }
    
    @IBInspectable var backgroundHighlightedColor: UIColor? = .clear {
        didSet {
            self.setBackgroundColor(color: backgroundHighlightedColor!, forState: .highlighted)
            self.setBackgroundColor(color: backgroundHighlightedColor!, forState: .selected)
        }
    }
    @IBInspectable var backgroundDisabledColor: UIColor? = .clear {
        didSet {
            self.setBackgroundColor(color: backgroundDisabledColor!, forState: .disabled)
        }
    }
    
    
    //MARK: - Title
    @IBInspectable var titleNormalColor: UIColor? = .clear {
        didSet {
            self.setTitleColor(titleNormalColor, for: .normal)
        }
    }
    
    @IBInspectable var titleHighlightedColor: UIColor? = .clear {
        didSet {
            self.setTitleColor(titleHighlightedColor, for: .highlighted)
            self.setTitleColor(titleHighlightedColor, for: .selected)
        }
    }
    
    @IBInspectable var titleDisabledColor: UIColor? = .clear {
        didSet {
            self.setTitleColor(titleDisabledColor, for: .disabled)
        }
    }
    
    //MARK: - Border
    @IBInspectable var borderNormalColor: UIColor? = .clear {
        didSet {
            layer.borderColor            =   borderNormalColor?.cgColor
        }
    }
    
    @IBInspectable var borderHighlightedColor: UIColor? = .clear
    @IBInspectable var borderDisabledColor: UIColor? = .clear
    
    @IBInspectable var gradientEnabled: Bool = false{
        didSet{
            setupGradient()
        }
    }
    
    //MARK: - Font
    @IBInspectable var fontSize: CGFloat = 0
    @IBInspectable var fontName: String? {
        didSet {
            if self.fontSize == 0 {
                if let name = fontName {
                    self.titleLabel?.font   =   UIFont(name: name, size: (self.titleLabel?.font.pointSize)!)
                } else {
                    self.titleLabel?.font   =   UIFont.systemFont(ofSize: (self.titleLabel?.font.pointSize)!)
                }
            } else {
                if let name = fontName {
                    self.titleLabel?.font   =   UIFont(name: name, size: fontSize)
                } else {
                    self.titleLabel?.font   =   UIFont.systemFont(ofSize: fontSize)
                }
            }
        }
    }
    
    @IBInspectable var height:CGFloat = 0 {
        didSet {
            if height > 0 {
                let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
                self.addConstraint(heightConstraint)
            } else {
                contentEdgeInsets.top = 0.02
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override open func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        addTarget(self, action: #selector(applyHighlightColors), for: .touchDown)
        addTarget(self, action: #selector(applyNormalColors), for: .touchUpInside)
        addTarget(self, action: #selector(applyNormalColors), for: .touchUpOutside)
        addTarget(self, action: #selector(applyNormalColors), for: .touchCancel)
    }
    
    @objc func applyNormalColors(sender: UIButton) {
        if isEnabled {
            backgroundColor     =   backgroundNormalColor
            layer.borderColor   =   borderNormalColor?.cgColor
        } else {
            backgroundColor     =   backgroundDisabledColor
            layer.borderColor   =   borderDisabledColor?.cgColor
        }
    }
    
    @objc func applyHighlightColors(sender: UIButton) {
        backgroundColor     =   backgroundHighlightedColor
        layer.borderColor   =   borderHighlightedColor?.cgColor
    }
    
    //MARK: - Gradient Background
    @IBInspectable var gradientStartColor: UIColor = UIColor.clear{
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var gradientEndColor: UIColor = UIColor.clear{
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var gradientHorizontal: Bool = false{
        didSet{
            setupGradient()
        }
    }
    
    var gradient: CAGradientLayer?
    
    func setupGradient(){
        guard gradientEnabled != false else {
            return
        }
        
        gradient?.removeFromSuperlayer()
        gradient = CAGradientLayer()
        guard let gradient = gradient else { return }
        
        gradient.frame = self.layer.bounds
        gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = gradientHorizontal ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 1)
        
        gradient.cornerRadius = self.cornerRadius
        
        self.layer.insertSublayer(gradient, below: self.imageView?.layer)
    }
    
    func loadStyle() {
        if let style = StyleManager.shared.find(byName: styleName) as? ButtonStyle {
            initProperties(withStyle: style)
        } else {
            print("Could not load style named \(styleName!)")
        }
    }
    
    func initProperties(withStyle style: ButtonStyle) {
        self.backgroundNormalColor =   style.backgroundNormalColor ?? .clear
        self.backgroundHighlightedColor =   style.backgroundHighlightedColor ?? .clear
        self.backgroundDisabledColor =   style.backgroundDisabledColor ?? .clear
        
        self.titleNormalColor =   style.titleNormalColor ?? .clear
        self.titleHighlightedColor = style.titleHighlightedColor ?? .clear
        self.titleDisabledColor = style.titleDisabledColor ?? .clear
        
        self.borderNormalColor = style.borderNormalColor ?? .clear
        self.borderHighlightedColor = style.borderHighlightedColor ?? .clear
        self.borderDisabledColor = style.borderDisabledColor ?? .clear
        
        self.cornerRadius = style.cornerRadius ?? 0
        self.borderWidth = style.borderWidth ?? 0
        
        if let size = style.fontSize {
            self.fontSize = size
        }
        self.fontName = style.fontName
        
        self.setNeedsDisplay()
    }
}
