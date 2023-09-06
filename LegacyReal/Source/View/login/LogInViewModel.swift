//
//  LogInViewModel.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import UIKit
protocol LogInViewModelDelegate: BaseViewModelDelegate {
}

class LogInViewModel: BaseViewModel {

    weak var delegate: LogInViewModelDelegate? {
        didSet {
            super.baseDelegate = delegate
        }
    }
    
    func login() {
        self.delegate?.showProgress()
        /*
        UserService.sharedInstance.login(email) { [weak self] (isSuccess, data) in
            guard let self = self else { return }
            self.delegate?.hideProgress()
            if isSuccess {
                self.showDisclaimer(user: data as? User)
            } else {
                AlertBuilder.failureAlertWithMessage(message: data as? String)
            }
        }
        */
    }

    /*
    private func showDisclaimer(user: User?) {
        AlertBuilder.alertSuccess(title: Strings.Disclaimer.title, message: Strings.Disclaimer.text, options:
            Strings.Button.cancel, Strings.Button.okay, completion: { (index) in
                if index == 1 {
                    // If the user logs in manually, the device token is not received in the login api response
                    // (This won't happen in live since in live they will login by ALM)
                    // Set "Admin" as device token in this case. "Admin" is being handled on the api side
                    let authToken = UserDefaults.standard.object(forKey: "x_auth_token") as? String
                    if authToken.isEmpty {
                        UserDefaults.standard.set("Admin", forKey: "x_auth_token")
                    }
                    AnalyticsManager.shared.identifyUser(with: self.email)
                    AnalyticsManager.shared.log(event: Event.login)
                    var currentSession = Session()
                    currentSession.loggedInUser = user
                    SessionManager.session = currentSession
                    UserDataManager.currentUser = user
                    AppNavigator.shared.navigate(to: HomeRoutes.home, with: .changeRoot)
                    UserService().syncApnsTokenForCurrentUser()
                }
        })
    }
     */
}
