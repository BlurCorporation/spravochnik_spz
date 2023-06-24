//
//  CalculationViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - CalculationViewProtocol

protocol CalculationViewProtocol: UIViewController {
    func updateHeader(viewModel: HeaderViewModel)
    func update(sections: [CalculationViewController.Section])
}

// MARK: - CalculationViewController

final class CalculationViewController: UIViewController {
    var presenter: CalculationPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private var sections: [CalculationViewController.Section] = []
    
    private lazy var calculationButton: CustomButton = {
        let button = CustomButton()
        button.mode = .black
        button.setTitle("calculationButtonText".localized,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(calculationButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var otherCalculationButton: CustomButton = {
        let button = CustomButton()
        button.mode = .white
        button.setTitle("otherCalculationButtonText".localized,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(otherCalculationButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ValueCoefficientTableViewCell.self,
                           forCellReuseIdentifier: ValueCoefficientTableViewCell.reuseIdentifier)
        tableView.register(CalculationHeaderViewCell.self,
                           forHeaderFooterViewReuseIdentifier: CalculationHeaderViewCell.identifier)
        tableView.register(CheckboxCoefficientTypeTableViewCell.self,
                           forCellReuseIdentifier: CheckboxCoefficientTypeTableViewCell.reuseIdentifier)
        tableView.register(ChoiceCoefficientTypeTableViewCell.self,
                           forCellReuseIdentifier: ChoiceCoefficientTypeTableViewCell.reuseIdentifier)
        tableView.register(DefaultValueCoefficientTableViewCell.self,
                           forCellReuseIdentifier: DefaultValueCoefficientTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViewController()
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Action
    
    @objc private func calculationButtonPressed() {
        calculationButton.pushAnimate { [weak self] in
            self?.presenter?.calculationButtonPressed()
        }
    }
    
    @objc private func otherCalculationButtonPressed() {
        otherCalculationButton.pushAnimate { [weak self] in
            self?.presenter?.otherCalculationButtonPressed()
        }
    }
}

// MARK: - CalculationViewProtocol Impl

extension CalculationViewController: CalculationViewProtocol {
    func updateHeader(viewModel: HeaderViewModel) {
        let header = CalculationHeaderViewCell(frame: .init(origin: .zero,
                                                            size: .init(width: UIScreen.main.bounds.width,
                                                                        height: Constants.Sizes.calculationHeaderHeight)))
        header.configure(with: viewModel)
        tableView.tableHeaderView = header
    }
    
    func update(sections: [Section]) {
        self.sections = sections
        tableView.reloadData()
    }
}

// MARK: - PrivateMethods

private extension CalculationViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    func addSubViews() {
        view.addSubviews(tableView,
                         buttonStackView)
        
        buttonStackView.addArrangedSubviews(calculationButton,
                                            otherCalculationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            calculationButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            otherCalculationButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: Constants.Constraints.sideOffset),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -Constants.Constraints.sideOffset),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: Constants.Sizes.tableViewTopOffset),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor)
        ])
    }
}

extension CalculationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].rows[indexPath.row] {
            
        case let .defaultvalueСoefficients(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultValueCoefficientTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? DefaultValueCoefficientTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
            
        case let .valueСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ValueCoefficientTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ValueCoefficientTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
            
        case let .choiceСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChoiceCoefficientTypeTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ChoiceCoefficientTypeTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
            
        case let .checkboxСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckboxCoefficientTypeTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? CheckboxCoefficientTypeTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
        }
    }
}

extension CalculationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let rowType = sections[indexPath.section].rows[indexPath.row]
        
        switch rowType {
        case .defaultvalueСoefficients:
            break
        case .valueСoefficient:
            break
        case .choiceСoefficient:
            break
        case .checkboxСoefficient:
            presenter?.checkBoxCellPressed(index: indexPath.row)
        }
    }
}

extension CalculationViewController {
    struct Section {
        let type: SectionType
        let rows: [RowType]
    }

    enum SectionType {
        case defaultvalueСoefficients
        case valueСoefficients
        case choiceСoefficients
        case checkboxСoefficient
    }

    enum RowType {
        case defaultvalueСoefficients(viewModel: DefaultCoefficientValueViewModel)
        case valueСoefficient(viewModel: ValueСoefficientViewModel)
        case choiceСoefficient(viewModel: ChoiceCoefficientViewModel)
        case checkboxСoefficient(viewModel: CheckboxСoefficientViewModel)
    }
}
