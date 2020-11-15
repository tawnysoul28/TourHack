//
//  MenuController.swift
//  BusBusterDemo
//
//  Created by Bob on 14.11.2020.
//  Copyright © 2020 Bob. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuCell"

enum MenuOptions: Int, CaseIterable, CustomStringConvertible {
    case info
	case logout
	case stop
    case cancelTrip

    var description: String {
        switch self {
        case .info: return "Информация о поездке"
		case .logout: return "Выйти из аккаунта"
		case .stop: return "Остановка"
        case .cancelTrip: return "Отменить экскурсию"
        }
    }
}

protocol MenuControllerDelegate: class {
    func didSelect(option: MenuOptions)
}

class MenuController: UITableViewController {

    // MARK: - Properties

    private let user: User
    weak var delegate: MenuControllerDelegate?

    private lazy var menuHeader: MenuHeader = {
        let frame = CGRect(x: 0,
                           y: 0,
                           width: self.view.frame.width - 80,
                           height: 140)
        let view = MenuHeader(user: user, frame: frame)
        return view
    }()

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
        view.backgroundColor = .white
        configureTableView()
    }

    // MARK: - Selectors

    // MARK: - Helper Functions

    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableHeaderView = menuHeader
    }
}

// MARK: - UITableViewDelegate/DataSource

extension MenuController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		var count = 0
		if self.user.accountType == .driver {
			return 3
		} else {
			count = MenuOptions.allCases.count
		}
        return MenuOptions.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        guard let option = MenuOptions(rawValue: indexPath.row) else { return UITableViewCell() }
        cell.textLabel?.text = option.description

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let option = MenuOptions(rawValue: indexPath.row) else { return }
        delegate?.didSelect(option: option)
    }
}
