////
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UITextView {

    //Method is used to limit the user to max 500 characters while typing/pasting the text in textView
    func shouldCheckMaxCharactersLimit(shouldChangeTextIn range: NSRange, replacementText text: String, maxChars: Int = 500) -> Bool {
        let currentText = self.text.orEmpty
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        return updatedText.count <= maxChars
    }

    func notEmpty() -> Bool {
        return self.text.notEmpty
    }
}
