//
//  CategoryTabBarController.swift
//  AppStoreClone
//
//  Created by Weijie Lin on 1/24/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class CategoryTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = FeaturedAppsController(collectionViewLayout: layout)
        let rootNavigationController = UINavigationController(rootViewController: featuredAppsController)
        
        rootNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        // Dummy controller for testing purpose
        let topChartsController = UIViewController()
        topChartsController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        topChartsController.view.backgroundColor = .white
        
        let searchController = UIViewController()
        searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        searchController.view.backgroundColor = .white
        
        viewControllers = [rootNavigationController, topChartsController, searchController]
    }
    
}
