//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UIScrollView {

    func scrollToHorizontalCenter() {
        // scroll to Horizontal center
        let newContentOffsetX = (self.contentSize.width - self.frame.size.width)/2
        self.setContentOffset(CGPoint(x: newContentOffsetX, y: 0), animated: false)
    }

    func scrollToHorizontalStart() {
        self.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
}
