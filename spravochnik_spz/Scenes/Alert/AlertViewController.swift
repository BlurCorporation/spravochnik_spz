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
    func updateUIForClear(title: String)
    func updateUIForVlaue(title: String)
    func updateUIForChoice(title: String, axis: ChoiceСoefficientType, numOfItems: Int)
    func updateUIForDefault(title: String)
    func update(dataSource: [String])
}

// MARK: - CalculationViewController

final class AlertViewController: UIViewController {
    var presenter: AlertPresenterProtocol?
    
    // MARK: - PrivateProperties
    private var numberOfItemsInSection = 0
    private var collectionViewAxis = CollectionViewAxis.horizontal
    private var collectionViewHeight: CGFloat = 0
    private var dataSource = [String]()
//    private var height: CGFloat = 272
    
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
        //        let layout = UICollectionViewFlowLayout()
        //        layout.estimatedItemSize = UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0 // задаем минимальный интервал между ячейками
        //        .collectionViewLayout = layout
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
//        collectionView.backgroundColor = .red
        collectionView.register(AlertCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    let leftButton: CustomButton = {
        let button = CustomButton()
        button.mode = .white
        //button.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let rightButton: CustomButton = {
        let button = CustomButton()
        button.mode = .black
        //button.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
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
        //        choiceCollectionView.collectionViewLayout = self
        
    }
    // MARK: - Action
    
    
}

// MARK: - AlertViewProtocol Impl

extension AlertViewController: AlertViewProtocol {
    func update(dataSource: [String]) {
        self.dataSource = dataSource
    }
    
    func updateUIForClear(title: String) {
        titleLabel.text = title
        print(choiceCollectionView.frame)
    }
    
    func updateUIForVlaue(title: String) {
        textField.isHidden = false
        titleLabel.text = title
//        height += 40
    }
    
    //TODO: - убрать numberOfItemsInSection
    func updateUIForChoice(title: String, axis: ChoiceСoefficientType, numOfItems: Int) {
        choiceCollectionView.isHidden = false
        numberOfItemsInSection = numOfItems
        titleLabel.text = title
        
        switch axis {
        case .terrain:
            collectionViewAxis = .vertical
            //TODO: - Организовать правильный датасоср
            
//            numberOfItemsInSection = dataSource.count // Для .terrain всегда константа 3 ячейки
            collectionViewHeight = CGFloat(dataSource.count * 60)
//            height += CGFloat(dataSource.count * 60)
//            print(height)
            choiceCollectionView.reloadData()
        default:
            collectionViewHeight = 60
            collectionViewAxis = .horizontal
//            for i in 0..<numberOfItemsInSection {
//                dataSource.append(String(i + 1))
//            }
            choiceCollectionView.reloadData()
        }
    }
    
    func updateUIForDefault(title: String) {
        // textField.isHidden = false
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! AlertCollectionViewCell
        
        cell.label.text = dataSource[indexPath.row]
        
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Impl

extension AlertViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionViewAxis {
        case .vertical:
            print(choiceCollectionView.bounds.size.width)
            print(CGSize(width: Int(choiceCollectionView.bounds.size.width), height: 50))
            return CGSize(width: Int(choiceCollectionView.bounds.size.width), height: 50)
        case .horizontal:
            return CGSize(width: Int(choiceCollectionView.bounds.size.width) / collectionView.numberOfItems(inSection: 0) - 8, height: 50)
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
        leftButton.setTitle("Закрыть", for: .normal)
        rightButton.setTitle("Сохранить", for: .normal)
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
            //            backgroundView.heightAnchor.constraint(equalToConstant: 264),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -16),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 16),
//            backgroundView.heightAnchor.constraint(equalToConstant: height),
            
//            titleLabel.heightAnchor.constraint(equalToConstant: 40),
//            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
//                                                constant: 45),
//            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
//                                                 constant: -45),
//            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor,
//                                            constant: 64),
//            titleLabel.bottomAnchor.constraint(equalTo: choiceCollectionView.topAnchor,
//                                               constant: 8),
//
//
//            choiceCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
//                                                      constant: 8),
//            choiceCollectionView.bottomAnchor.constraint(equalTo: leftRightButtonsStackView.topAnchor,
//                                                         constant: -32),
//            choiceCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
//                                                          constant: 8),
//            choiceCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
//                                                           constant: -8),
            choiceCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
//
//            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
//                                           constant: 24),
//            textField.bottomAnchor.constraint(equalTo: leftRightButtonsStackView.topAnchor,
//                                              constant: -32),
//            textField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
//                                               constant: 24),
//            textField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
//                                                constant: -24),
//            textField.heightAnchor.constraint(equalToConstant: 40),
//
//
//            leftRightButtonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
//            leftRightButtonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
//            leftRightButtonsStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -64),
//            leftRightButtonsStackView.heightAnchor.constraint(equalToConstant: 48)
            
            
            
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            textField.heightAnchor.constraint(equalToConstant: 40),
            commonStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 64),
            commonStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            commonStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            commonStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -64),
            leftRightButtonsStackView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
