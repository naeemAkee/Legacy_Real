//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UIImage {

    static let calendar = UIImage(systemName: "calendar")
    static let chevronRight = UIImage(systemName: "chevron.right")
    static let chevronDown = UIImage(systemName: "chevron.down")
    static let lineHorizontal3 = UIImage(systemName: "line.horizontal.3")
    static let eyeFill = UIImage(systemName: "eye.fill")
    static let signature = UIImage(systemName: "signature")
    static let squareAndArrowUp = UIImage(systemName: "square.and.arrow.up")
    static let clockFill = UIImage(systemName: "clock.fill")

    /// create an new image with the provided color as a background.
    ///
    /// - Parameters:
    ///   - color: required color
    ///   - size: size of the image
    /// - Returns: image
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(origin: CGPoint.zero, size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}
