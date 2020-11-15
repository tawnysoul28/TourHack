//
//  MenuHeader.swift
//  BusBusterDemo
//
//  Created by Bob on 14.11.2020.
//  Copyright © 2020 Bob. All rights reserved.
//

import UIKit

class MenuHeader: UIView {

    // MARK: - Properties

    private let user: User

    private lazy var profileImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .black

        view.addSubview(initialLabel)
        initialLabel.centerX(inView: view)
        initialLabel.centerY(inView: view)

        return view
    }()

    private lazy var initialLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42)
        label.textColor = .white
        label.text = user.firstInitial
        return label
    }()

    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = user.fullname
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "test@gmail.com"
        label.text = user.email
        return label
    }()

    let pickupModeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 1.0, alpha: 0.9)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

	static var pickupModeSwitch: UISwitch = {
        let s = UISwitch()
        s.isOn = true
        s.tintColor = .white
        s.onTintColor = .mainBlueTint
        s.addTarget(self, action: #selector(handlePickupModeChanged), for: .valueChanged)
        return s
    }()

    // MARK: - Lifecycle

    init(user: User, frame: CGRect) {
        self.user = user
        super.init(frame: frame)

        backgroundColor = .systemBlue

        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 4, paddingLeft: 12,
                                width: 64, height: 64)
        profileImageView.layer.cornerRadius = 64 / 2

        let stack = UIStackView(arrangedSubviews: [fullnameLabel, emailLabel])
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .vertical

        addSubview(stack)
        stack.centerY(inView: profileImageView,
                      leftAnchor: profileImageView.rightAnchor,
                      paddingLeft: 12)

        configureSwitch(enabled: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors

    @objc func handlePickupModeChanged() {
		if MenuHeader.pickupModeSwitch.isOn == true {
			sendNotificationStart()
		}
    }

    // MARK: - Helper Functions

    func configureSwitch(enabled: Bool) {
        if user.accountType == .driver {
            addSubview(pickupModeLabel)
            pickupModeLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)

			addSubview(MenuHeader.pickupModeSwitch)
			MenuHeader.pickupModeSwitch.anchor(top: pickupModeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 16)

			MenuHeader.pickupModeSwitch.isOn = enabled
            pickupModeLabel.text = enabled ? "ПОКАЗЫВАТЬ, ГДЕ Я" : "ПОКАЗЫВАТЬ, ГДЕ Я"
        }
    }
}
