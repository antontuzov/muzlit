//
//  ViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        
        
        
    }

    
    @objc private func didTapSettings() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    

}

