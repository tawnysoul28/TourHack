//
//  SettingsController.swift
//  BusBusterDemo
//
//  Created by Bob on 14.11.2020.
//  Copyright © 2020 Bob. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "LocationCell"

protocol SettingsControllerDelegate: class {
    func updateUser(_ controller: SettingsController)
}

class SettingsController: UIViewController {

    // MARK: - Properties

    var user: User

    weak var delegate: SettingsControllerDelegate?
    var userInfoUpdated = false

	private var infoView = UIView()
	let wrapper = UIView()


    // MARK: - Lifecycle

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
		configureNavigationBar()
		configureTripInfo()

    }

    // MARK: - Selectors
    // MARK: - Helper Functions

	func configureTripInfo() {

		view.backgroundColor = .white

		let tourInfo: UITextView = {
			let label = UITextView()
			label.text = "Экскурсия"
			label.font = UIFont(name: "Avenir-Light", size: 25)
//			label.textColor = UIColor(white: 1, alpha: 0.8)

			// Description
			label.text = """
			1. Экскурсия:
			Москва 2.0

			2. Статус:
			Оплачено

			3. Автобус:
			Серый Hyanday, P777OO

			4. Номер гида:
			+7-800-555-35-35

			5. Маршрут
			Красная площадь,
			Третьяковская галерея
			
			6. Время посадки:
			8:00
			"""
			return label
		}()

		view.addSubview(tourInfo)
		tourInfo.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(55)
			make.leading.trailing.bottom.equalToSuperview().offset(10)
        }

//
//		let moscow: UILabel = {
//			let label = UILabel()
//			label.text = "Москва 2.0"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
////			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let status: UILabel = {
//			let label = UILabel()
//			label.text = "Статус:"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
////			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let paid: UILabel = {
//			let label = UILabel()
//			label.text = "Оплачено"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
////			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let bus: UILabel = {
//			let label = UILabel()
//			label.text = "Автобус:"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
////			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let greyHunday: UILabel = {
//			let label = UILabel()
//			label.text = "Серый Hyanday, P777OO"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let numberGid: UILabel = {
//			let label = UILabel()
//			label.text = "Номер гида:"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let number: UILabel = {
//			let label = UILabel()
//			label.text = "+7-(800)-555-35-35"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let route: UILabel = {
//			let label = UILabel()
//			label.text = "Маршрут:"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let places: UILabel = {
//			let label = UILabel()
//			label.text = "Красная площадь /nТретьяковская галерея"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let getOn: UILabel = {
//			let label = UILabel()
//			label.text = "Время посадки:"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//		let time: UILabel = {
//			let label = UILabel()
//			label.text = "8:00"
//			label.font = UIFont(name: "Avenir-Light", size: 20)
//			label.textColor = UIColor(white: 1, alpha: 0.8)
//			return label
//		}()
//
//        wrapper.backgroundColor = .white
//        wrapper.layer.cornerRadius = 15
//        wrapper.layer.masksToBounds = true
//		view.addSubview(wrapper)
//        wrapper.anchor(top: view.bottomAnchor, left: view.leftAnchor,
//                     right: view.rightAnchor, paddingTop: 40, paddingLeft: 16,
//                     paddingRight: 16)
//
//
//        let stackView = UIStackView(arrangedSubviews: [excursion,
//													   moscow,
//													   status,
//													   paid,
//													   bus,
//													   greyHunday,
//													   numberGid,
//													   number,
//													   route,
//													   places,
//													   getOn,
//													   time
//													   ])
//		stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//		stackView.spacing = 24
//
//        view.addSubview(stackView)
//        stackView.anchor(top: wrapper.bottomAnchor, left: wrapper.leftAnchor,
//                     right: wrapper.rightAnchor, paddingTop: 40, paddingLeft: 16,
//                     paddingRight: 16)


//		headerLabel.font = UIFont.userFont(name: .medium, size: 24)
//		view.addSubview(headerLabel)
//		headerLabel.text = "IntercomViewController.title".localized()
//		headerLabel.snp.makeConstraints { make in
//			make.top.equalTo(topSafeArea).offset(10)
//			make.leading.trailing.equalToSuperview().inset(30)
//			make.height.equalTo(40)
//		}

	}

    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Информация об экскурсии"

//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_clear_white_36pt_2x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissal))
    }
}

