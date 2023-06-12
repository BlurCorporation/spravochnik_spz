//
//  ResultViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: -  ResultViewProtocol

protocol  ResultViewProtocol: UIViewController {
    func update(sections: [ResultViewController.Section])
    func setupNavigationItem(title: String)
}

// MARK: -  ResultViewController

final class  ResultViewController: UIViewController {
    var presenter:  ResultPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private var sections: [ResultViewController.Section] = []
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Constants.Images.backButtomImage,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(backButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let navigationItemTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = Constants.Fonts.h4
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Constants.Images.delete,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(deleteButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .black
        button.setTitle(Constants.TextButtons.saveResultCalculation,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(calculationButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .white
        button.setTitle(Constants.TextButtons.shareResultСalculation,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(shareButtonButtonPressed),
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
        tableView.dataSource = self
        tableView.delegate = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        tableView.separatorStyle = .none
        tableView.register(ValueCoefficientResultTypeTableViewCell.self,
                           forCellReuseIdentifier: ValueCoefficientResultTypeTableViewCell.reuseIdentifier)
        tableView.register(ChoiceCoefficientResultTypeTableViewCell.self,
                           forCellReuseIdentifier: ChoiceCoefficientResultTypeTableViewCell.reuseIdentifier)
        tableView.register(DefaultValueCoefficientResultTypeTableViewCell.self,
                           forCellReuseIdentifier: DefaultValueCoefficientResultTypeTableViewCell.reuseIdentifier)
        tableView.register(CheckboxCoefficientResultTypeTableViewCell.self,
                           forCellReuseIdentifier: CheckboxCoefficientResultTypeTableViewCell.reuseIdentifier)
        tableView.register(CalculationResultTypeTableViewCell.self,
                           forCellReuseIdentifier: CalculationResultTypeTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViewController()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Action
    
    @objc private func backButtonPressed() {
        presenter?.backButtonPressed()
    }
    
    @objc private func deleteButtonPressed() {
        presenter?.deleteButtonPressed()
    }
    
    @objc private func calculationButtonPressed() {
        presenter?.calculationButtonPressed()
    }
    
    @objc private func shareButtonButtonPressed() {
        presenter?.shareButtonButtonPressed()
    }
    
    @objc private func otherCalculationButtonPressed() {
        presenter?.otherCalculationButtonPressed()
    }
}

// MARK: -  ResultSystemViewProtocol Impl

extension  ResultViewController: ResultViewProtocol {
    func update(sections: [ResultViewController.Section]) {
        self.sections = sections
        tableView.reloadData()
    }
    
    func setupNavigationItem(title: String) {
        navigationItemTitleLabel.text = title
    }
}

// MARK: - PrivateMethods

private extension  ResultViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    func setupNavigationBar() {
        presenter?.setupNavigetionItemTitle()
    
        navigationItem.setHidesBackButton(true,
                                          animated: true)
        let backButtom = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtom
        
        navigationItem.titleView = navigationItemTitleLabel
        
        let deleteButton = UIBarButtonItem(customView: deleteButton)
        navigationItem.rightBarButtonItem = deleteButton
    }
    
    func addSubViews() {
        view.addSubviews(tableView,
                         buttonStackView)
        
        buttonStackView.addArrangedSubviews(saveButton,
                                            shareButton,
                                            otherCalculationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            shareButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            otherCalculationButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: Constants.Constraints.sideOffset),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Constraints.sideOffset),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: Constants.Sizes.tableViewTopOffset),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor)
        ])
    }
}

extension ResultViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 40
        case 4:
            return 40
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let headerView = UIView.init(frame: CGRect.init(x: 0,
                                                            y: 0,
                                                            width: tableView.frame.width,
                                                            height: 50))
            
            let label = UILabel()
            label.backgroundColor = Constants.Colors.whiteCellColor
            label.frame = CGRect.init(x: 16,
                                      y: 0,
                                      width: headerView.frame.width-10,
                                      height: headerView.frame.height-10)
            label.text = Constants.TextLabels.dataForCalculationHeaderTitle
            label.font = Constants.Fonts.h3
            label.textColor = Constants.Colors.dark
            
            headerView.addSubview(label)
            
            return headerView
        case 4:
            let headerView = UIView.init(frame: CGRect.init(x: 0,
                                                            y: 0,
                                                            width: tableView.frame.width,
                                                            height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 16,
                                      y: 0,
                                      width: headerView.frame.width-10,
                                      height: headerView.frame.height-10)
            label.text = Constants.TextLabels.resultCalculationHeaderTitle
            label.font = Constants.Fonts.h3
            label.textColor = Constants.Colors.dark
            
            headerView.addSubview(label)
            
            return headerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 4:
            return 20
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 4:
            return UIView()
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].rows[indexPath.row] {
           
            
        case let .defaultvalueСoefficients(viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DefaultValueCoefficientResultTypeTableViewCell.reuseIdentifier,
                for: indexPath) as? DefaultValueCoefficientResultTypeTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
        case let .valueСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ValueCoefficientResultTypeTableViewCell.reuseIdentifier,
                for: indexPath) as? ValueCoefficientResultTypeTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
        case let .choiceСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChoiceCoefficientResultTypeTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ChoiceCoefficientResultTypeTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
        case let .checkboxСoefficient(viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CheckboxCoefficientResultTypeTableViewCell.reuseIdentifier,
                for: indexPath) as? CheckboxCoefficientResultTypeTableViewCell else {
#if DEBUG
                fatalError("Check table cell")
#else
                return UITableViewCell()
#endif
            }
            cell.configure(with: viewModel)
            return cell
        case let.calculationResult(viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CalculationResultTypeTableViewCell.reuseIdentifier,
                for: indexPath) as? CalculationResultTypeTableViewCell else {
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

extension ResultViewController: UITableViewDelegate {}

extension ResultViewController {
    struct Section {
        let type: SectionType
        let rows: [RowType]
    }

    enum SectionType {
        case defaultvalueСoefficients
        case valueСoefficients
        case choiceСoefficients
        case checkboxСoefficient
        case calculationResult
    }

    enum RowType {
        case defaultvalueСoefficients(viewModel: DefaultCoefficientValueResultViewModel)
        case valueСoefficient(viewModel: ValueСoefficientResultViewModel)
        case choiceСoefficient(viewModel: ChoiceCoefficientResultViewModel)
        case checkboxСoefficient(viewModel: CheckboxСoefficientResultViewModel)
        case calculationResult(viewModel: CalculationResultViewModel)
    }
}
