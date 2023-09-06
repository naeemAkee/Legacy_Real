//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import UIKit

@objc protocol BaseViewModelDelegate: AnyObject {
    func showProgress()
    func hideProgress()

    func showAlert(title: String?, message: String?, completion: ((Int) -> Void)?)
    func showAlert(alert: UIAlertController)
    func dismissView()
    func dismissViewWithCompletion(completionBlock: @escaping () -> Void)
    func showErrorAlert(message: String?)
    func showSuccessAlert(message: String?)
    func showWarningAlert(message: String?)
    func showInfoAlert(message: String?)
}

public class BaseViewModel {

    weak var baseDelegate: BaseViewModelDelegate?

    // to be used for pagination and server side searching
    var pageNumber = 1
    var searchQuery = ""
    var isLoading = false
    var isMoreDataAvailable = true

}
