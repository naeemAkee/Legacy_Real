//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

typealias ConfirmHandler = () -> Void
typealias CancelHandler = () -> Void

class AlertBuilder: NSObject {

    class func alertSuccess(title: String = Strings.Common.success, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = prepareAlert(title: title, message: message)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (_) in
                completion(index)
            }))
        }
        self.show(alertController: alertController)
    }

    class func alertfailure(title: String = Strings.Errors.error, message: String?, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = prepareAlert(title: title, message: message)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction(title: option, style: .default, handler: { _ in
                completion(index)
            }))
        }
        self.show(alertController: alertController)
    }

    private class func show(alertController: UIAlertController) {
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }

    public static func successAlertWithMessage(message: String?) {
        self.alertWithTitle(title: Strings.Common.success, message: message, cancelButtonShow: false, confirmHandler: nil)
    }

    public static func failureAlertWithMessage(message: String?) {
        self.alertWithTitle(title: Strings.Errors.error, message: message, cancelButtonShow: false, confirmHandler: nil)
    }

    public static func alertWithMessage(title: String?, message: String?, confirmHandler: ConfirmHandler?) {
        self.alertWithTitle(title: title, message: message, cancelButtonShow: true, confirmHandler: confirmHandler)
    }

    public static func deleteConfirmation(title: String?, message: String?, confirmHandler: ConfirmHandler?) -> UIAlertController {
        let alert = prepareAlert(title: title, message: message)
        addAction(alert: alert, title: Strings.Button.delete, style: .destructive, handler: confirmHandler)
        addAction(alert: alert, title: Strings.Button.cancel, style: .cancel)
        return alert
    }

    public static func alertWithTitle(title: String?, message: String?, cancelButtonShow: Bool, confirmHandler: ConfirmHandler?) {
        let alert = prepareAlert(title: title, message: message)
        addAction(alert: alert, title: Strings.Button.okay, style: .default, handler: confirmHandler)

        if(cancelButtonShow) {
            addAction(alert: alert, title: Strings.Button.cancel, style: .cancel)
        }
        showAlert(alert: alert)
    }

    static func prepareAlert(title: String?, message: String?) -> UIAlertController {
        AppLogger.log("🔶🔶🔶🔶 Presented alert with title: \(title.orDash) and message: \(message.orDash)")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.setUpDarkTheme()
        return alertController
    }

    class func prepareAlert(title: String = Strings.Common.success, message: String, options: String..., completion: @escaping (Int) -> Void) -> UIAlertController {
        let alertController = prepareAlert(title: title, message: message)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (_) in
                completion(index)
            }))
        }
        return alertController
    }

    private static func showAlert(alert: UIAlertController) {
        DispatchQueue.main.async {
            self.topMostController().present(alert, animated: true, completion: nil)
        }
    }

    static func topMostController() -> UIViewController {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController!
    }

    static func addAction(alert: UIAlertController, title: String?, style: UIAlertAction.Style, handler: ConfirmHandler? = nil) {
        alert.addAction(UIAlertAction(title: title, style: style, handler: { _ in
            if(handler != nil) {
                handler!()
            }
        }))
    }
}
