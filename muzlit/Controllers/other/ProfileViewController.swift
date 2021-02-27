//
//  ProfileViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        APICaller.shared.getCurrentUserProfile { result  in
            switch result {
            case.success(let model):
               break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    

   

}
