//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UIAlertController {
    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }

    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }

    //Set title font and title color
    func setTitleColorAndFont(font: UIFont? = UIFont.boldSystemFont(ofSize: 17.0), color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)
        let range = NSRange(location: 0, length: title.utf8.count)
        if attributeString.hasRange(range) {
            if let titleFont = font {
                attributeString.addAttributes([NSAttributedString.Key.font: titleFont],
                    range: range)
            }

            if let titleColor = color {
                attributeString.addAttributes([NSAttributedString.Key.foregroundColor: titleColor],
                    range: range)
            }
        } else {
            return
        }

        self.setValue(attributeString, forKey: "attributedTitle")
    }

    //Set message font and message color
    func setMessageColorAndFont(font: UIFont? = UIFont.systemFont(ofSize: 13.0), color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        let range = NSRange(location: 0, length: message.utf8.count)
        if attributeString.hasRange(range) {

            if let messageFont = font {
                attributeString.addAttributes([NSAttributedString.Key.font: messageFont], range: range)
            }

            if let messageColor = color {
                attributeString.addAttributes([NSAttributedString.Key.foregroundColor: messageColor], range: range)
            }
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }

    func setUpDarkTheme() {
        //white color of alert's text
        self.setTitleColorAndFont(color: UIColor.white)
        self.setMessageColorAndFont(color: UIColor.white)
        self.setBackgroundColor(color: UIColor.alertBackground) //~black background color
    }
}
