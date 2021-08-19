//
//  WelcomeViewController.swift
//  muzlit
//
//  Created by Anton Tuzov on 25.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Sign In with Muzlit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    
    
    private let imageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.image = UIImage(named: "albums")
           return imageView
       }()

       private let overlayView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.alpha = 0.2
           return view
       }()

       private let logoImageView: UIImageView = {
           let imageView = UIImageView(image: UIImage(named: "logo"))
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()

       private let label: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.textAlignment = .center
           label.textColor = .white
           label.font = .systemFont(ofSize: 32, weight: .semibold)
           label.text = "Listen to Millions\nof Songs on\nthe go."
           return label
       }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Muzlit"
        view.addSubview(imageView)
        view.addSubview(overlayView)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        overlayView.frame = view.bounds
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
        guard success else {
            let alert = UIAlertController(title: "Opps", message: "Something went wrong when signing in!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
        
        
         }
   

}
