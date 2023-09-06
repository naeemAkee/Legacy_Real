//
//  SceneDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {

    open var  baseViewModel: BaseViewModel!
    private static var progressView: MBProgressHUD?
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // for some reason setupCustomPropertiesOnView is not invoked if called here
        // child method is called instead
        styleNavigationBar()

        // prints the name of the viewController
        AppLogger.log("🔶🔶🔶🔶 Did Load \(String(describing: self)) 🔶🔶🔶🔶")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppLogger.log("🔶🔶🔶🔶 Will Appear \(String(describing: self)) 🔶🔶🔶🔶")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppLogger.log("🔶🔶🔶🔶 Will Disappear \(String(describing: self)) 🔶🔶🔶🔶")
    }

    // to override
    func setupCustomPropertiesOnView() {
    }

    func populateViewWithData() {
    }

    private func styleNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func createBarButtonWithTitle(title: String, disabledColor: Bool = false, image: String? = nil, imageEdgeInsets: UIEdgeInsets? = nil,
                                  target: Any?, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        if disabledColor {
            button.setTitleColor(UIColor.gray, for: .disabled)
        }
        if let image = image {
            if let img = UIImage(systemName: image) {
                button.setImage(img, for: .normal)
            } else {
                button.setImage(UIImage(named: image), for: .normal)
            }
        }
        if let imageEdgeInsets = imageEdgeInsets {
            button.imageEdgeInsets = imageEdgeInsets
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
}

extension BaseViewController: UIPopoverPresentationControllerDelegate {

    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        // to prevent modal dismissal by hand gesture
        return false
    }
}

extension BaseViewController: BaseViewModelDelegate {

    func showProgress() {
        if BaseViewController.progressView != nil {
            self.hideProgress()
        }

        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isUserInteractionEnabled = false
            self.navigationController?.view.isUserInteractionEnabled = false
            let progressView = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressView.label.text = Strings.Alerts.loaderPrimaryMessage
            BaseViewController.progressView = progressView
            // Set a timer task to update the loader message when it take longer than 4 seconds on screen.
            self.timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.updateLoaderMessage), userInfo: nil, repeats: false)
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }

    func hideProgress() {
        DispatchQueue.main.async {
            // invalidate the timer.
            self.timer?.invalidate()
            self.navigationController?.navigationBar.isUserInteractionEnabled = true
            self.navigationController?.view.isUserInteractionEnabled = true

            BaseViewController.progressView?.hide(animated: true)
            // do not dim/turn off the display when some network action is in progress.
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }

    @objc func updateLoaderMessage() {
        BaseViewController.progressView?.label.text = Strings.Alerts.loaderSecondaryMessage
    }


    func showAlert(title: String?, message: String?, completion: ((Int) -> Void)? = nil) {
        let alert = AlertBuilder.prepareAlert(title: title.orEmpty, message: message.orEmpty, options: Strings.Button.okay, completion: { (index) in
            if let completion = completion {
                completion(index)
            }
        })
        self.showAlert(alert: alert)
    }

    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }

    func dismissViewWithCompletion(completionBlock: @escaping () -> Void) {
        self.dismiss(animated: true, completion: completionBlock)
    }

    func showInfoAlert(message: String?) {
        self.showAlert(title: Strings.Common.info, message: message)
    }

    func showErrorAlert(message: String?) {
        self.showAlert(title: Strings.Errors.error, message: message)
    }

    func showSuccessAlert(message: String?) {
        self.showAlert(title: Strings.Common.success, message: message)
    }

    func showWarningAlert(message: String?) {
        self.showAlert(title: Strings.Errors.warning, message: message)
    }

    func showAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}
