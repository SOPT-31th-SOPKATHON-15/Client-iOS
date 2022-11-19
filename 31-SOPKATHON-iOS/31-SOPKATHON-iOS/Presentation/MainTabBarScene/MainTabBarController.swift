//
//  MainTabBarController.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import UIKit

public class MainTabBarController: RDTabBarController {
    
    // MARK: - View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.setTabBar()
            self.setMiddleButtonAction()
        }
    }
}

// MARK: - Methods

extension MainTabBarController {
    private func setTabBar() {
        let homeVC = HomeVC()
        let listVC = ListVC()
        listVC.view.backgroundColor = .cyan
        homeVC.view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "홈",
                                          image: UIImage(systemName: "homekit"),
                                          selectedImage: UIImage(systemName: "homekit"))
        listVC.tabBarItem = UITabBarItem(title: "보관함",
                                             image: UIImage(systemName: "archivebox.fill"),
                                             selectedImage: UIImage(systemName: "archivebox.fill"))
        
        setViewControllers([homeVC, listVC], animated: false)
        
        if let items = self.tabBar.items {
            self.rdTabBar.add(items: items)
        }
        self.rdTabBar.tintColor = .white
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setMiddleButtonAction() {
        self.middleButtonAction = {
            let vc = AddVC()
            vc.view.backgroundColor = .white
            self.present(vc, animated: true)
        }
    }
}

