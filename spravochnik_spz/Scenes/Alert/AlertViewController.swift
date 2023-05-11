//
//  AlertViewController.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.03.2023.
//

import UIKit

enum CollectionViewAxis {
    case vertical
    case horizontal
}

// MARK: - CalculationViewProtocol

//TODO: добавить value
protocol AlertViewProtocol: UIViewController {
    func updateUIForClear(title: String,
                          leftButtonTitle: String,
                          rightButtonTitle: String)
    func updateUIForVlaue(title: String,
                          value: Double)
    func updateUIForChoice(title: String,
                           axis: ChoiceСoefficientType,
                           numOfItems: Int)
    func update(dataSource: [String])
}

// MARK: - CalculationViewController

final class AlertViewController: UIViewController {
    var presenter: AlertPresenterProtocol?
    
    // MARK: - PrivateProperties
    private var collectionViewAxis = CollectionViewAxis.horizontal
    private var collectionViewHeight: CGFloat = 0
    private var dataSource = [String]()
    var previousSelected : IndexPath?
    var currentSelected : Int?
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let view = UIVisualEffectView(effect: blurEffect)
        view.frame = UIScreen.main.bounds
        
        return view
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Constants.Fonts.h1
        label.numberOfLines = 0
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 11
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let choiceCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0 // задаем минимальный интервал между ячейками
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(AlertCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private let leftButton: CustomButton = {
        let button = CustomButton()
        button.mode = .white
        button.setTitle("Закрыть", for: .normal)
//        button.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let rightButton: CustomButton = {
        let button = CustomButton()
        button.mode = .black
        button.setTitle("Сохранить", for: .normal)
        button.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let leftRightButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 28
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceCollectionView.isHidden = true // Может это вынести куда-нибудь? Если вынести в viewWillAppear, то работать не будет
        textField.isHidden = true
        presenter?.viewDidLoad()
        setupViewController()
        choiceCollectionView.dataSource = self
        choiceCollectionView.delegate = self
        
    }
    // MARK: - Action
    
    @objc
    func rightButtonPressed() {
        rightButton.pushAnimate { [weak self] in
            self?.presenter?.rightButtonPressed()
        }
    }
    
}

// MARK: - AlertViewProtocol Impl

extension AlertViewController: AlertViewProtocol {
    func update(dataSource: [String]) {
        self.dataSource = dataSource
    }
    
    func updateUIForClear(title: String,
                          leftButtonTitle: String,
                          rightButtonTitle: String) {
        titleLabel.text = title
        leftButton.setTitle(leftButtonTitle,
                            for: .normal)
        rightButton.setTitle(rightButtonTitle,
                             for: .normal)
    }
    
    func updateUIForVlaue(title: String,
                          value: Double) {
        textField.isHidden = false
        if value != 0.0 {
            textField.placeholder = value.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", value) : String(value)
        }
        
        textField.textAlignment = .center
        titleLabel.text = title
    }
    
    //TODO: - убрать numberOfItemsInSection
    func updateUIForChoice(title: String,
                           axis: ChoiceСoefficientType,
                           numOfItems: Int) {
        choiceCollectionView.isHidden = false
        titleLabel.text = title
        switch axis {
        case .terrain:
            collectionViewAxis = .vertical
            collectionViewHeight = CGFloat(dataSource.count * 60)
            choiceCollectionView.reloadData()
        default:
            collectionViewHeight = 60
            collectionViewAxis = .horizontal
            choiceCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource Impl

extension AlertViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.row
        previousSelected = indexPath
        
        // For reload the selected cell
        self.choiceCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! AlertCollectionViewCell
        cell.label.text = dataSource[indexPath.row]
        
        if currentSelected != nil && currentSelected == indexPath.row {
            cell.label.textColor = Constants.Colors.dark
            cell.layer.borderColor = Constants.Colors.dark.cgColor
        } else {
            cell.label.textColor = Constants.Colors.grayCellColor
            cell.layer.borderColor = Constants.Colors.grayCellColor.cgColor
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Impl

extension AlertViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionViewAxis {
        case .vertical:
            return CGSize(width: Int(choiceCollectionView.bounds.size.width),
                          height: 50)
        case .horizontal:
            return CGSize(width: Int(choiceCollectionView.bounds.size.width) / collectionView.numberOfItems(inSection: 0) - 8,
                          height: 50)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


// MARK: - PrivateMethods

private extension AlertViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .clear
        navigationController?.isNavigationBarHidden = true
    }
    
    func addSubViews() {
        leftRightButtonsStackView.addArrangedSubviews(leftButton,
                                                      rightButton)
        
        commonStackView.addArrangedSubviews(titleLabel,
                                            choiceCollectionView,
                                            textField,
                                            leftRightButtonsStackView)
        view.addSubviews(blurView,
                         backgroundView,
                         commonStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -16),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 16),
            
            choiceCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
            
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            commonStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                                 constant: 64),
            commonStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                     constant: 24),
            commonStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                      constant: -24),
            commonStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                                    constant: -64),
            
            leftRightButtonsStackView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
