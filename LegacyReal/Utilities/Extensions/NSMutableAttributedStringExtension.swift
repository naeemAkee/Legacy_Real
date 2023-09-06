////
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension NSMutableAttributedString {
    func hasRange(_ range: NSRange) -> Bool {
        return Range(range, in: self.string) != nil
    }
}
