//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import UIKit

extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(class: T.Type) {
        self.register(UINib(nibName: T.className(), bundle: nil),
                      forCellWithReuseIdentifier: T.className())
    }
}
