//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UITextField {
    func observeTextDidChange(observer: Any, selector aSelector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: aSelector,
                                               name: UITextField.textDidChangeNotification, object: self)
    }

    //Method is used to limit the user to max 250 characters while typing/pasting the text in textField
    func shouldCheckMaxCharactersLimit(shouldChangeTextIn range: NSRange, replacementText text: String, textLimit: Int = 250) -> Bool {
        let currentText = self.text.orEmpty
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        return updatedText.count <= textLimit
    }

    // Method to limit the decimal number input upto 2 when user enter numbers in textfield.
    func shouldCheckMaxDecimalLimit(textField: UITextField, shouldChangeTextIn range: NSRange, replacementText text: String, allowedDecimalDigits: Int = 2) -> Bool {
        guard let oldText = textField.text, let range = Range(range, in: oldText) else {
            return true
        }

        // In a numeric string, it counts dots and it checks for distance between the first dot and the end index of that string. Then it simply returns the number of digits occuring after the decimal dot.
        let newText = oldText.replacingCharacters(in: range, with: text)
        let isNumericOrEmptyString = newText.isEmpty || (Double(newText) != nil)
        let numberOfDots = newText.components(separatedBy: ".").count - 1

        let numberOfDecimalDigits: Int
        if let dotIndex = newText.firstIndex(of: ".") {
            numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
        } else {
            numberOfDecimalDigits = 0
        }
        // if the Numeric string is empty OR actually a double number string which contains upto max allowed decimal digits, return true.
        return isNumericOrEmptyString && numberOfDots <= 1 && numberOfDecimalDigits <= allowedDecimalDigits
    }

    func isEmpty() -> Bool {
        return self.text.orEmpty.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func notEmpty() -> Bool {
        return !isEmpty()
    }

    func trimmedText() -> String? {
        return self.text?.byRemovingWhiteSpaces()
    }

    func disableEditing() {
        self.disableUserInteraction()
        textColor = .uncheckedForeground
    }
}
