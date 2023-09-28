//
//  MainViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - MainViewProtocol

protocol MainViewProtocol: UIViewController {}

// MARK: - MainViewController

final class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private lazy var cells = MainCollectionViewModel.cells
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "mainHeaderLabelText".localized
        label.font = Constants.Fonts.h2
        label.numberOfLines = .zero
        label.textAlignment = .left
        return label
    }()
    
    private lazy var helpButton: UIButton = {
        let button = UIButton()
        let image = Constants.Images.helpImage
        button.setImage(image,
                        for: .normal)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.layer.cornerRadius = 7
        button.addTarget(self,
                         action: #selector(helpButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: CustomUICollectionViewFlowLayout())
        collectionView.register(MainCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? CustomUICollectionViewFlowLayout {
            layout.layoutDelegate = self
        }
    }
    
    // MARK: - Actions
    
    @objc private func helpButtonPressed() {
        helpButton.pushAnimate { [weak self] in
            self?.presenter?.helpButtonPressed()
        }
    }
}

// MARK: - MainViewProtocol Impl

extension MainViewController: MainViewProtocol {}

// MARK: - CustomLayoutDelegate Impl

extension MainViewController: CustomLayoutDelegate {
    func heightFor(index: Int) -> CGFloat {
        let safeAreaHeight = collectionView.frame.height
        let smallButtonsHeight = safeAreaHeight * 0.5 * 0.48 - 8
        let bigButtonsHeight = safeAreaHeight * 0.5 * 0.52 - 8
        let bottomHalfButtonsHeight = safeAreaHeight * 0.25 - 8
        
        switch index {
        case 0:
            return smallButtonsHeight
        case 1:
            return bigButtonsHeight
        case 2:
            return bigButtonsHeight
        case 3:
            return smallButtonsHeight
        case 4:
            return bottomHalfButtonsHeight
        case 5:
            return bottomHalfButtonsHeight
        case 6:
            return bottomHalfButtonsHeight
        default:
            return bottomHalfButtonsHeight
        }
    }
}

// MARK: - UICollectionViewDataSource Impl

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! MainCollectionViewCell
        
        let object = cells[indexPath.row]
        
        presenter?.cellSet(object: object,
                           cell: cell)
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.pushAnimate { [weak self] in
            self?.presenter?.openCalculationCellSelected(index: indexPath.row)
        }
    }
}

// MARK: - PrivateMethods

private extension MainViewController {
    func setupViewController() {
        navigationController?.isNavigationBarHidden = true
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
        helpButton.isHidden = true
    }
    
    func addSubViews() {
        view.addSubviews(headerLabel,
                         collectionView,
                         helpButton)
    }
    
    func setupConstraints() {
        let mainButtonSize = CGFloat(40)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -Constants.Constraints.sideOffset),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Constants.Constraints.sideOffset),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.Sizes.headerHeight),
            
            helpButton.heightAnchor.constraint(equalToConstant: mainButtonSize),
            helpButton.widthAnchor.constraint(equalToConstant: mainButtonSize),
            helpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                 constant: -Constants.Constraints.sideOffset),
            helpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: Constants.Constraints.sideOffset),
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}
