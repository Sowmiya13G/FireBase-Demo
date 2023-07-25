//
//  Extention.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 21/07/23.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue
              layer.masksToBounds = (newValue > 0)
        }
    }
    
}
@IBDesignable extension UIView {
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable var shadowOpacity: CGFloat {
        get { return CGFloat(layer.shadowOpacity) }
        set { layer.shadowOpacity = Float(newValue) }
    }

    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
}
@IBDesignable extension UIView {
     @IBInspectable var startColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    @IBInspectable var endColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                func draw(_ rect: CGRect) {
                    let gradient: CAGradientLayer = CAGradientLayer()
                    gradient.frame = CGRect(x: CGFloat(0),
                                            y: CGFloat(0),
                                            width: superview!.frame.size.width,
                                            height: superview!.frame.size.height)
                    gradient.colors = [startColor!.cgColor, endColor!.cgColor]
                    gradient.zPosition = -1
                    layer.addSublayer(gradient)
                }
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
        
        }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}




@IBDesignable class GradientView: UIView {
    @IBInspectable var topColor: UIColor = UIColor.clear
    @IBInspectable var bottomColor: UIColor = UIColor.clear

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
