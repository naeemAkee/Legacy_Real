//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UINavigationItem {

func setTitleAndSubTitle(title: String, subtitle: String) {

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.sizeToFit()

        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = .customGreyTitlesColor
        subtitleLabel.font = .systemFont(ofSize: 15.0)
        subtitleLabel.textAlignment = .center
        subtitleLabel.sizeToFit()

        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center

        let width = max(titleLabel.frame.size.width, subtitleLabel.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)

        self.titleView = stackView
    }
}
