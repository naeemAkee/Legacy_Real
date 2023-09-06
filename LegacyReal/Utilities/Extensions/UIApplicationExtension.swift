//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UIApplication {
    class func showNetworkActivity() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    class func hideNetworkActivity() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
