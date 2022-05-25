//
//  RSUtils.swift
//  RSUtils
//
//  Created by Nguyễn Hà on 25/05/2022.
//

import Foundation
import UIKit

enum RoundedType {
    case left, right, top, bottom, onlyLeft, onlyTopLeft, onlyTopRight
}

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set(value) {
            layer.borderColor = value.cgColor
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }

    func roundCorners(cornerRadius: CACornerMask, radius: CGFloat) {
        clipsToBounds = true
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = 10
            self.layer.maskedCorners = cornerRadius
        }
     }

    func setRounded(radius: CGFloat, type: RoundedType) {
        self.clipsToBounds = true
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = convertCornerType(type).lastestType
        } else {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: convertCornerType(type).earlierType,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }

    private func convertCornerType(_ type: RoundedType) -> (lastestType: CACornerMask, earlierType: UIRectCorner) {
        var lastestType: CACornerMask = .layerMinXMaxYCorner
        var earlierTypes: UIRectCorner = .bottomLeft
        switch type {
        case .left:
            lastestType = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            earlierTypes = [.topLeft, .bottomLeft]
        case .right:
            lastestType = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            earlierTypes = [.topRight, .bottomRight]
        case .bottom:
            lastestType = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            earlierTypes = [.bottomLeft, .bottomRight]
        case .top:
            lastestType = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            earlierTypes = [.topLeft, .topRight]
        case .onlyLeft:
            lastestType = [.layerMinXMaxYCorner]
            earlierTypes = [.bottomLeft]
        case .onlyTopLeft:
            lastestType = [.layerMinXMinYCorner]
            earlierTypes = [.topLeft]
        case .onlyTopRight:
            lastestType = [.layerMaxXMinYCorner]
            earlierTypes = [.topRight]
        }
        return (lastestType, earlierTypes)
    }

}
