//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeReusableCell<T: UICollectionViewCell>(forIndexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: forIndexPath) as? T else {
            fatalError("Unable to deque resuable cell with identifier \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableSupplementaryViewHeader<T: UICollectionReusableView>(forIndexPath: IndexPath) -> T {
        guard let reusableView = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                       withReuseIdentifier: T.reuseIdentifier, for: forIndexPath) as? T else {
            fatalError("Unable to deque resuable view with identifier \(T.reuseIdentifier)")
        }
        return reusableView
    }

    //Returns a cell from the collection view at the specified indexPath
    func cellForItem<T: UICollectionViewCell>(at indexPath: IndexPath) -> T? {
        return cellForItem(at: indexPath) as? T
    }
}
