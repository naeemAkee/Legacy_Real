//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UITableView {

    func registerCell<T: UITableViewCell>(class: T.Type) {
        self.register(UINib(nibName: T.className(), bundle: nil),
                           forCellReuseIdentifier: T.className())
    }

    func registerHeaderFooter<T: UITableViewHeaderFooterView>(class: T.Type) {
        let headerNib = UINib(nibName: T.className(), bundle: Bundle.main)
        self.register(headerNib, forHeaderFooterViewReuseIdentifier: T.className())
    }
}
