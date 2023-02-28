//
//  CalculationViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

struct HeaderViewModel {
    let title: String
}

// MARK: - CalculationViewProtocol

protocol CalculationViewProtocol: UIViewController {
    func updateHeader(viewModel: HeaderViewModel)
    func update(sections: [Section])
}

// MARK: - CalculationViewController

final class CalculationViewController: UIViewController {
    var presenter: CalculationPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private var sections: [Section] = []
    
    private lazy var calculationButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .black
        button.setTitle(Constants.TextButtons.calculationButtonText,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(calculationButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var otherCalculationButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .transparent
        button.setTitle(Constants.TextButtons.otherCalculationButtonText,
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
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.register(ValueCoefficientTableViewCell.self,
                           forCellReuseIdentifier: ValueCoefficientTableViewCell.reuseIdentifier)
        tableView.register(CalculationHeaderViewCell.self,
                           forHeaderFooterViewReuseIdentifier: CalculationHeaderViewCell.identifier)
        tableView.register(CheckboxCoefficientTypeTableViewCell.self,
                           forCellReuseIdentifier: CheckboxCoefficientTypeTableViewCell.reuseIdentifier)
        tableView.register(ChoiceCoefficientTypeTableViewCell.self,
                           forCellReuseIdentifier: ChoiceCoefficientTypeTableViewCell.reuseIdentifier)
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
        print(#function)
    }
    
    @objc private func otherCalculationButtonPressed() {
        print(#function)
    }
    
    
}

// MARK: - CalculationViewProtocol Impl

extension CalculationViewController: CalculationViewProtocol {
    func updateHeader(viewModel: HeaderViewModel) {
        let header = CalculationHeaderViewCell(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: 100)))
        header.configure(with: viewModel.title)
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
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Constraints.sideOffset),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: 0)
        ])
    }
}

extension CalculationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].rows[indexPath.row] {
            
        case let .valueСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ValueCoefficientTableViewCell.reuseIdentifier, for: indexPath) as? ValueCoefficientTableViewCell else {
                fatalError()
            }
            cell.configure(with: viewModel)
            return cell
            
        case let .choiceСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChoiceCoefficientTypeTableViewCell.reuseIdentifier, for: indexPath) as? ChoiceCoefficientTypeTableViewCell else {
                fatalError()
            }
            cell.configure(with: viewModel)
            return cell
            
        case let .checkboxСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckboxCoefficientTypeTableViewCell.reuseIdentifier, for: indexPath) as? CheckboxCoefficientTypeTableViewCell else {
                fatalError()
            }
            cell.configure(with: viewModel)
            return cell
        }
    }
}

extension CalculationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowType = sections[indexPath.section].rows[indexPath.row]
        
        switch rowType {
        case .valueСoefficient:
            break
        case .choiceСoefficient:
            break
        case .checkboxСoefficient:
            presenter?.checkBoxCellPressed(index: indexPath.row)
        }
    }
}

struct Section {
    let type: SectionType
    let rows: [RowType]
}

enum SectionType {
    case valueСoefficients
    case choiceСoefficients
    case checkboxСoefficient
}

enum RowType {
    case valueСoefficient(viewModel: ValueСoefficientViewModel)
    case choiceСoefficient(viewModel: ChoiceCoefficientViewModel)
    case checkboxСoefficient(viewModel: CheckboxСoefficientViewModel)
}

