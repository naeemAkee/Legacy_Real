//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

protocol ReusableView {
    static var reuseIdentifier: String {get}
}

extension ReusableView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
