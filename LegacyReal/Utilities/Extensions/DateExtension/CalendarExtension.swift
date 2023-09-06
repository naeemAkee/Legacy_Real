//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension Calendar {
    func monthNameFrom(monthNo: Int) -> String {
        return DateFormatter().monthSymbols[monthNo - 1]
    }
}
