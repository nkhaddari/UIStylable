//
//  StyleManager.swift
//  UIStylable
//
//  Created by Nabil El khaddari on 06/12/2020.
//
import UIKit

public class StyleManager {
    
    public var stylesLoaded = false
    public static let shared = StyleManager()
    private var styles = [String: Any]()
    private init() {}
    
    public func loadStyles() {
        loadStyles(fromFile: "componentStyle")
    }
    
    public func loadStyles(fromFile fileName: String) {
        var rawStyles = [String: [String: Any]]()
        var bundle: Bundle?
        #if TARGET_INTERFACE_BUILDER
        bundle = Bundle(for: type(of: self))
        #else
        bundle = Bundle.main
        #endif
        
        if let path = bundle?.path(forResource: fileName, ofType: "plist") {
            rawStyles = NSDictionary(contentsOfFile: path) as? [String: [String: Any]] ?? [String: [String: Any]]()
        }
        for (key, properties) in rawStyles {
            guard let componentType =  properties["componentType"] as? String,
                  let type = ComponentType(rawValue: componentType) else {
                break
            }
            switch type {
            case .label :
                let style = LabelStyle(identifier: key, properties: properties)
                styles[key] = style
            }
        }
        stylesLoaded = true
    }
    
    public func find(byName name: String) -> Any? {
        if !stylesLoaded {
            loadStyles()
        }
        return styles[name]
    }
}
