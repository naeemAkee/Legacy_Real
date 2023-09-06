//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

public extension UIBarButtonItem {

    func enable() {
        self.isEnabled = true
    }

    func disable() {
        self.isEnabled = false
    }

    @objc func debounce(delay: Double = 1.5) {
        // enable the button after 1.5 seconds
        self.disable()
        let deadline = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.enable()
        }
    }
}
