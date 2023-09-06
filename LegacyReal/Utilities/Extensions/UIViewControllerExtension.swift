//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UIViewController {

    // Represent whether the UIViewController is presented modally or pushed on a nav controller
    var isModal: Bool {

        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }

    // getting top view controller currently visible
    func topViewController() -> UIViewController {

        if let presented = self.presentedViewController {
            return presented.topViewController()
        }

        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topViewController() ?? navigation
        }

        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topViewController() ?? tab
        }

        return self
    }
}
