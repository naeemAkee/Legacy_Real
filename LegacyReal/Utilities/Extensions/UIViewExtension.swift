//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UIView {

    // MARK: - Instance methods
    //Change the default values for params as you wish
    func addBorder(color: UIColor = UIColor.black, weight: CGFloat = 1.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = weight
    }

    func setRoundBorders(_ cornerRadius: CGFloat = 10.0, color: UIColor = UIColor.black, weight: CGFloat = 1.0) {
        clipsToBounds = true
        layer.borderColor = color.cgColor
        layer.borderWidth = weight
        layer.cornerRadius = cornerRadius
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    var typeName: String {
        return String(describing: type(of: self))
    }

    func instanceFromNib(withName name: String) -> UIView? {
        return UINib(nibName: name,
                     bundle: nil).instantiate(withOwner: self,
                                              options: nil).first as? UIView
    }

    func addNibView(withNibName nibName: String? = nil,
                    withAutoresizingMasks masks: AutoresizingMask = [.flexibleWidth, .flexibleHeight]) -> UIView {
        let name = String(describing: type(of: self))
        guard let view = instanceFromNib(withName: nibName ?? name) else {
            assert(false, "No nib found with that name")
            return UIView()
        }
        view.frame = bounds
        view.autoresizingMask = masks
        addSubview(view)
        return view
    }

    func animateChangeInLayout(withDuration duration: TimeInterval = 0.2) {
        setNeedsLayout()
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.layoutIfNeeded()
        })
    }

    func show() {
        self.isHidden = false
    }

    func hide() {
        self.isHidden = true
    }

    func disableUserInteraction() {
        self.isUserInteractionEnabled = false
    }

    func enableUserInteraction() {
        self.isUserInteractionEnabled = true
    }

    /// Returns all parent views of a given view
    var ancestors: AnyIterator<UIView> {
        var current: UIView = self

        return AnyIterator<UIView> {
            guard let parent = current.superview else {
                return nil
            }
            current = parent
            return parent
        }
    }

    //Get Parent View Controller from any view
    func parentViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while !(responder is UIViewController) {
            responder = responder?.next
            if nil == responder {
                break
            }
        }
        return (responder as? UIViewController)
    }
}

extension Array where Element: UIView {
    func addBorder(color: UIColor = UIColor.black, weight: CGFloat = 1.0) {
        for view in self {
            view.addBorder(color: color, weight: weight)
        }
    }
    func roundBorders(cornerRadius: CGFloat = 10.0) {
        for view in self {
            view.setRoundBorders(cornerRadius)
        }
    }
}
