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
}

// MARK: - CalculationViewController

final class AlertViewController: UIViewController {
    var presenter: AlertPresenterProtocol?
    
    // MARK: - PrivateProperties
    private var numberOfItemsInSection = 0
    private var collectionViewAxis = CollectionViewAxis.horizontal
    
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
        label.text = "Уверены, что хотите выйти из аккаунта"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
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
    
    private let choiceCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0 // задаем минимальный интервал между ячейками
//        .collectionViewLayout = layout
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.register(AlertCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViewController()
        choiceCollectionView.dataSource = self
        choiceCollectionView.delegate = self
//        choiceCollectionView.collectionViewLayout = self
        presenter?.viewDidLoad()
    }
    
    // MARK: - Action
    
    
}

// MARK: - AlertViewProtocol Impl

extension AlertViewController: AlertViewProtocol {
    func updateUIForClear(title: String) {
        print(choiceCollectionView.frame)
    }
    
    func updateUIForVlaue(title: String) {
        // textField.isHidden = false
    }
    
    
    func updateUIForChoice(title: String, axis: ChoiceСoefficientType, numOfItems: Int) {
        // collectionView.isHidden = false
        numberOfItemsInSection = numOfItems
        switch axis {
        case .terrain:
            collectionViewAxis = .vertical
            choiceCollectionView.reloadData()
        default:
            collectionViewAxis = .horizontal
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
        return numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! AlertCollectionViewCell
//        cell.backgroundColor = .blue
        switch collectionViewAxis {
        case .horizontal:
            cell.label.text = String(indexPath.row + 1)
        case .vertical:
            cell.label.text = ""
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Impl

extension AlertViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionViewAxis {
        case .horizontal:
            return CGSize(width: Int(choiceCollectionView.bounds.size.width) / collectionView.numberOfItems(inSection: 0), height: 50)
        case .vertical:
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
        leftRightButtonsStackView.addArrangedSubviews(leftButton, rightButton)
        view.addSubviews(blurView, backgroundView, titleLabel, choiceCollectionView, leftRightButtonsStackView)
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
            
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                constant: 45),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                 constant: -45),
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                            constant: 64),
            
            choiceCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                      constant: 8),
            choiceCollectionView.bottomAnchor.constraint(equalTo: leftRightButtonsStackView.topAnchor,
                                                         constant: -8),
            choiceCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                          constant: 8),
            choiceCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                           constant: -8),
            choiceCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            leftRightButtonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            leftRightButtonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            leftRightButtonsStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -64),
            leftRightButtonsStackView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
