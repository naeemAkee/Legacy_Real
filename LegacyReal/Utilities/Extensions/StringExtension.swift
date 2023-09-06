////
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension String {

    var localized: String {
        return self.localize()
    }

    var notEmpty: Bool {
        return !self.isEmpty
    }

    func localize(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

    func floatValue() -> Float {
        return Float(self.replacingOccurrences(of: ",", with: ""))!
    }

    func intValue() -> Int {
        return Int(self) ?? 0
    }

    func doubleValue() -> Double {
        if let value = (self as NSString?)?.doubleValue {
            return value
        }
        return 0.0
    }

    func asData() -> Data {
        return String(self).data(using: .utf8) ?? Data()
    }

    func caseInsensitiveEqual(to other: String) -> Bool {
        return self.localizedCaseInsensitiveCompare(other) == .orderedSame
    }

    func byReplacingDoubleQuotes() -> String {
        // replacing latin char of double quotes with standard double quotes using escape sequence
        return self.replacingOccurrences(of: "”", with: "\"")
    }

    /// A function that removes leading and trailing white space characters from the string
    /// - Returns: Updated string without white space characters
    func byRemovingWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func containsValue(_ value: String) -> Bool {
        return self.localizedCaseInsensitiveContains(value)
    }
}
