//
//  SavedCalculationsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SavedCalculationsViewProtocol

protocol SavedCalculationsViewProtocol: UIViewController {}

// MARK: - SavedCalculationsViewController

final class SavedCalculationsViewController: UIViewController {
    var presenter: SavedCalculationsTablePresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private lazy var calculations = SavedCalculationsCellModel.calculations
    
    private let headerView = SavedCalcCustomHeaderCell()
    
    private let SavedCalculationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Constants.Colors.clear
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        SavedCalculationsTableView.dataSource = self
        SavedCalculationsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - SavedCalculationsViewProtocol Impl

extension SavedCalculationsViewController: SavedCalculationsViewProtocol {}

// MARK: - UITableViewDataSource Impl

extension SavedCalculationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return calculations.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedCalculationsUITableViewCell.identifier,
                                                 for: indexPath) as! SavedCalculationsUITableViewCell
        let object = calculations[indexPath.row]
        
        presenter?.cellSet(object: object,
                           cell: cell,
                           indexPathRow: indexPath.row)
        
        return cell
    }
}

// MARK: - UITableViewDelegate Impl

extension SavedCalculationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.Sizes.savedCalcHeaderHeight
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            calculations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        presenter?.openCell(image: calculations[indexPath.row].image)
    }
}

// MARK: - PrivateMethods

private extension SavedCalculationsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
        SavedCalculationsTableView.register(SavedCalculationsUITableViewCell.self,
                           forCellReuseIdentifier: SavedCalculationsUITableViewCell.identifier)
        SavedCalculationsTableView.separatorColor = Constants.Colors.clear
    }
    
    func addSubViews() {
        view.addSubviews(SavedCalculationsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            SavedCalculationsTableView.topAnchor.constraint(equalTo: view.topAnchor,
                                                            constant: Constants.Constraints.topTableViewOffset),
            SavedCalculationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SavedCalculationsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            SavedCalculationsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
}
