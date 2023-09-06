//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UITableView {

    func dequeReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to deque reusable cell with identifier "+T.reuseIdentifier)
        }
        return cell
    }

    func dequeReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to deque reusable headerFooter with identifier  "+T.reuseIdentifier)
        }
        return headerFooterView
    }

    func cellForRow<T: UITableViewCell>(atRow row: Int, inSection section: Int = 0) -> T? {
        return cellForRow(at: IndexPath(row: row, section: section)) as? T
    }
}
