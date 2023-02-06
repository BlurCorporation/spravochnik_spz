//
//  TabBarController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 06.02.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable = SceneBuildManager()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
}

private extension TabBarController {
    func setupTabBarController() {
        let mainViewController = sceneBuildManager.buildMainScreen()
        let savedCalculationViewController = sceneBuildManager.buildSavedCalculationsScreen()
        let profileViewController = sceneBuildManager.buildProfileScreen()
        
        let navMainViewController = UINavigationController(rootViewController: mainViewController)
        let navSavedCalculationViewController = UINavigationController(rootViewController: savedCalculationViewController)
        let navProfileViewController = UINavigationController(rootViewController: profileViewController)
        
        mainViewController.tabBarItem.image = UIImage(named: "TabBarMain")
        savedCalculationViewController.tabBarItem.image = UIImage(named: "TabBarSaved")
        navProfileViewController.tabBarItem.image = UIImage(named: "TabBarProfile")
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .systemBackground
        
        viewControllers = [navMainViewController,
                           navSavedCalculationViewController,
                           navProfileViewController]
    }
}

