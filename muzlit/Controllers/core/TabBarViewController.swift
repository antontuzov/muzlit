//
//  TabBarViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        
        
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: searchVC)
        let nav3 = UINavigationController(rootViewController: libraryVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "music.note.house"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "doc.text.magnifyingglass"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 2)
        
        
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3], animated: false)
        
    }
    

 

}
