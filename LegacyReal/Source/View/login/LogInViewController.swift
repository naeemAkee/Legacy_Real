//
//  LogInViewController.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import UIKit

class LogInViewController: BaseViewController {

    // MARK: - Outlets

    @IBOutlet weak var mobileNoTextField: UITextField!
    @IBOutlet weak var btnSendOTP: UIButton!

    var viewModel: LogInViewModel! {
        didSet {
            super.baseViewModel = viewModel
        }
    }

    // MARK: - Lifecycle Events

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomPropertiesOnView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: Private methods
    override func setupCustomPropertiesOnView() {

    }

    // MARK: - Actions

    @IBAction func didTapSendOTPButton(_ sender: UIButton) {
        if let  vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
