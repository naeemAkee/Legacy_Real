//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UITabBar {
    // Workaround for iOS 11's new UITabBar behavior where on iPad, the UITabBar inside
    // the Master view controller shows the UITabBarItem icon next to the text
    override open var traitCollection: UITraitCollection {
        var newTraitCollection: [UITraitCollection] = [super.traitCollection]
        if UIDevice.current.userInterfaceIdiom == .pad {
            newTraitCollection += [UITraitCollection(horizontalSizeClass: .compact)]
        }
        return UITraitCollection(traitsFrom: newTraitCollection)
    }
}
