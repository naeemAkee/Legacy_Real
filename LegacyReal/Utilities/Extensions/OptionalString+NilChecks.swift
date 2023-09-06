////
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }

    var notEmpty: Bool {
        return !isEmpty
    }

    var isEmpty: Bool {
        return self.orEmpty.byRemovingWhiteSpaces().isEmpty
    }

    var orDash: String {
        return (self != nil && self.notEmpty) ? self.orEmpty : "-"
    }

    var orZero: String {
        return self ?? "0"
    }

    var orNotApplicable: String {
        return (self != nil && self.notEmpty) ? self.orEmpty : "N/A"
    }

    func doubleValue() -> Double {
        // remove comma "," from value if any
        let newStr = self?.replacingOccurrences(of: ",", with: "")
        return (newStr as NSString?)?.doubleValue ?? 0
    }

//    func with2Decimal() -> String {
//        return doubleValue().toStringWith2Decimals()
//    }

    func containsValue(_ value: String) -> Bool {
        return self.orEmpty.containsValue(value)
    }

//    func isValidEmailAddress() -> Bool {
//        return Validations.isValidEmailAddress(email: self)
//    }
//
//    func isValidUSPhoneNumber() -> Bool {
//        return Validations.isValidUSPhoneNumber(phone: self)
//    }
}

extension Optional where Wrapped == Double {
    var orZero: Double {
        return self ?? 0
    }
}

extension Optional where Wrapped == Int {

    var orZero: Int {
        return self ?? 0
    }

//    var orZeroString: String {
//        return orZero.toString()
//    }
}

extension Optional where Wrapped == Bool {

    var orFalse: Bool {
        return self ?? false
    }

    var orTrue: Bool {
        return self ?? true
    }
}

extension Optional where Wrapped == Date {

    var orCurrent: Date {
        return self ?? Date()
    }
}

extension Optional where Wrapped: Collection {
    // returns an empty Array if given collection is nil
    var orEmptyArray: [Wrapped.Element] {
        return self as? [Wrapped.Element] ?? []
    }
}
