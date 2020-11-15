//
//  AuthButton.swift
//  BusBusterDemo
//
//  Created by Bob on 13.11.2020.
//  Copyright © 2020 Bob. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 5
        backgroundColor = .mainBlueTint
        setTitleColor(.white, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
