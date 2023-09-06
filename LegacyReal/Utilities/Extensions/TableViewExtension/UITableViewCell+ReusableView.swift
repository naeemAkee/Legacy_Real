//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UITableViewCell: ReusableView {

    func setEnable(_ enable: Bool) {
        for view in contentView.subviews {
            view.alpha = enable ? 1 : 0.7
        }
    }
}
