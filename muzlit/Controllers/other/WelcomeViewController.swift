//
//  WelcomeViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Muzlit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        
        return button
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Muzlit"
        view.backgroundColor = .systemBlue
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20, y: view.height-50-view.safeAreaInsets.bottom,
                                    width: view.width-40,
                                    height: 50)
        
    }

    
//    here may be some error (be cefule)
    @objc  func didTapSignIn() {
        let vc = AuthViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        vc.completionHandler = { [weak self ] success in
        DispatchQueue.main.async {
            self?.handlerSignIn(success: success)
        }
      }
    }
    
    
    
      private func handlerSignIn(success: Bool ) {
//         log user in or yell if error
    
    
         }
   

}
