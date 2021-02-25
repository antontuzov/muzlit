//
//  AuthViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit
import WebKit

class AuthViewController: UIViewController,WKNavigationDelegate {

    
    
    
    private let webView: WKWebView = {
            
       let config = WKWebViewConfiguration()
        let prefs = WKWebpagePreferences()
        config.defaultWebpagePreferences = prefs
        prefs.allowsContentJavaScript = true
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?
        
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       title = "Sign in"
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        webView.navigationDelegate = self
        guard let url = AuthManager.shared.signInURL else {
            
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
        
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        
        }
        let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: {$0.name == "code"})?.value else {
            return
        }
        webView.isHidden = true
        print("Code:\(code)")
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self]seccess in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler?(seccess)
            }
        }
    }
    

}
