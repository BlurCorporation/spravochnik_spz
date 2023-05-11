//
//  SavedCalculationsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SavedCalculationsViewProtocol

protocol SavedCalculationsViewProtocol: UIViewController {
    func update(dataSource: [SavedCalculationsCellModelProtocol])
    
}

// MARK: - SavedCalculationsViewController

final class SavedCalculationsViewController: UIViewController {
    var presenter: SavedCalculationsTablePresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private var dataSource: [SavedCalculationsCellModelProtocol] = [SavedCalculationsCellModelProtocol]()
    
    
    
    private let headerView = SavedCalcCustomHeaderCell()
    
    private let SavedCalculationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Constants.Colors.clear
        
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        setupViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SavedCalculationsTableView.dataSource = self
        SavedCalculationsTableView.delegate = self
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - SavedCalculationsViewProtocol Impl

extension SavedCalculationsViewController: SavedCalculationsViewProtocol {
    func update(dataSource: [SavedCalculationsCellModelProtocol]) {
        self.dataSource = dataSource
        self.SavedCalculationsTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource Impl

extension SavedCalculationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCalculationsUITableViewCell.identifier,
                                                       for: indexPath) as? SavedCalculationsUITableViewCell else {
            return UITableViewCell()
        }
//        
        cell.viewModel = dataSource[indexPath.row]
        cell.selectionStyle = .none
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
        return Constants.Sizes.headerHeight
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = dataSource[indexPath.row]
//            object.removeHandler?()
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: .fade)
        }
        if dataSource.isEmpty {
            
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
        
        presenter?.openCell(text: dataSource[indexPath.row].system)
    }

}

// MARK: - PrivateMethods

private extension SavedCalculationsViewController {
    func setupViewController() {
        navigationController?.isNavigationBarHidden = true
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
