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
    
    private let collectionView: UICollectionView = {
        

        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: CustomUICollectionViewFlowLayout())
        
        collectionView.backgroundColor = .red
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? CustomUICollectionViewFlowLayout {
            layout.layoutDelegate = self
        }
    }
    
    
}

// MARK: - MainViewProtocol Impl

extension MainViewController: MainViewProtocol {}

// MARK: - UICollectionViewDelegate Impl

extension MainViewController: UICollectionViewDelegate {

}

extension MainViewController: CustomLayoutDelegate {
    func heightFor(index: Int) -> CGFloat {
        switch index {
        case 0:
            return 154
        case 1:
            return 174
        case 2:
            return 174
        case 3:
            return 154
        case 4:
            return 174
        case 5:
            return 174
        case 6:
            return 156
        default:
            return 10
        }
    }
}

// MARK: - UICollectionViewDataSource Impl

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        switch section {
//        case 1:
//            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        default:
//            return UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.row {
//        case 0:
//            return CGSize(width: 168, height: 154)
//        case 1:
//            return CGSize(width: 168, height: 174)
//        case 2:
//            return CGSize(width: 168, height: 174)
//        case 3:
//            return CGSize(width: 168, height: 154)
//        case 4:
//            return CGSize(width: 168, height: 174)
//        case 5:
//            return CGSize(width: 168, height: 174)
//        case 6:
//            return CGSize(width: 343, height: 156)
//        default:
//            return CGSize(width: 10, height: 10)
//        }
//        
//    }
}

// MARK: - PrivateMethods

private extension MainViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
        view.addSubviews(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}
