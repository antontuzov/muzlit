//
//  AuthManager.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import Foundation


final class AuthManager {
    
    static let shared = AuthManager()
    
    
    struct Constants {
          static let clientID = "d103c0878789437a912080354309ab99"
          static let clientSicret = "212d7352a0674902be9651322b760ce1"
          static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        
//        let UserReadEmail = "antontuzovf@gmail.com"
        let redirectURL = "https://www.iosacademy.io"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scopes=\(scopes)&redirect_uri=\(redirectURL)&show_dialog=TRUE"
      
        return URL(string: string)
        
    }
    
    
    
    
    
    
    private init() {}
    
    var isSignedIn: Bool {
        
      return accessToken != nil
    }
    
    private var accessToken: String? {
        return nil
        
    }
    
    
    private var refreashToken: String? {
        return nil
        
    }
    
    
    private var tokenExpirationDate: Data? {
        return nil
        
    }
    
    
    private var shoudRefreashToken: Bool? {
        return false
        
    }
    
    
    public func exchangeCodeForToken(code:String, completion: @escaping ((Bool) -> Void)){
    
//    get token
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
           URLQueryItem(name: "grant_type", value: "authorization_code"),
           URLQueryItem(name: "code", value: code),
           URLQueryItem(name: "redirect_uri", value: "https://www.iosacademy.io"),
          
            
        ]
        
        
      var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        let basicToken = Constants.clientID + ":" + Constants.clientSicret
        let data = basicToken.data(using: .utf8)
        guard let  base64String = data?.base64EncodedString() else {
            print("Failure to get base64 ")
            completion(false)
            return
            
            
        }
        
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
      let task =  URLSession.shared.dataTask(with: request) {[weak self] data, _, error  in
            guard let data = data, error == nil else {
                completion(false)
                return
                
            }
        do{
            let result = try JSONDecoder().decode(AuthResponse.self, from: data)
            self?.cacheToken(result: result)
            
            
            
          
            
            completion(true)
        }catch{
            print(error.localizedDescription)
            completion(false)
        }
        
        
        
        
            
        }
        task.resume()
        
    }
    
    
    
    public func refreshAccessToken() {
        
        
        
    }
    
    
    
    private func cacheToken(result: AuthResponse) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
        UserDefaults.standard.setValue(result.refresh_token, forKey: "refresh_token")
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey: "expirationDate")
    }
    
    
    
    
    
    
    
}
