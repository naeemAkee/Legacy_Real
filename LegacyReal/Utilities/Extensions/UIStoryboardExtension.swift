//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import UIKit

extension UIStoryboard {

    class func instantiateViewController <T: UIViewController>(_ type: T.Type, storyboardIdentifier: String = "Home") -> T? {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        return storyboard.instantiateViewController(type)
    }

    func instantiateViewController <T: UIViewController>(_ type: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: type)) as? T
    }
}
