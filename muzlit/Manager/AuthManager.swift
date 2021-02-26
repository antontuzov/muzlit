//
//  AuthManager.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import Foundation


final class AuthManager {
    
    static let shared = AuthManager()
    
    private var refreshingToken = false
    
    
    
    
    
    struct Constants {
          static let clientID = "d103c0878789437a912080354309ab99"
          static let clientSicret = "212d7352a0674902be9651322b760ce1"
          static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    
    public var signInURL: URL? {
        let scopes = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-read-collaborative%20user-follow-read%20user-library-modify%20user-library-read%20user-read-email"
        
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
        return UserDefaults.standard.string(forKey: "access_token")
        
    }
    
    
    private var refreashToken: String? {
        return UserDefaults.standard.string(forKey: "refreash_token")
        
    }
    
    
    private var tokenExpirationDate: Data? {
        
        return UserDefaults.standard.object(forKey: "expirationDate") as? Data
        
    }
    
//     here maybe problem
    private var shouldRefreashToken: Bool  {
//        guard let expirationDate = tokenExpirationDate else 
        guard tokenExpirationDate != nil else {
            
            return false
        }
        let currentDate = Date()
        let fiveMinutes: TimeInterval = 300
        return currentDate.addingTimeInterval(fiveMinutes) >= currentDate
//        currentDate.addingTimeInterval(fiveMinutes)
// expirationDate
    }
    
    
    public func exchangeCodeForToken(code:String, completion: @escaping ((Bool) -> Void)){
    
//    got token
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
//                self?.cacheToken(result: result)
                
            
                completion(true)
            }catch{
                print(error.localizedDescription)
                completion(false)
            }
            
            
            
            
                
            }
            task.resume()
            
        }
    
    
//     very strang
    public func withValidToken(compleiton: @escaping (Bool) -> Void) {
        guard !refreshingToken else {
//            append the compleiton
            return
            
        }
        if shouldRefreashToken {
            refreshIfNeeded { [weak self ] success in
                    if let token = self?.accessToken, success{
                        compleiton(true)
                }
            }
        }
            else if let token = accessToken {
            compleiton(true)
        }
        
        
    }
    
    private var onRefreshBlocks = [((Bool) -> Void)]()
    
    
    
    public func refreshIfNeeded( compleiton: @escaping  (Bool) -> Void){
        guard !refreshingToken else {
            
            
            onRefreshBlocks.append(compleiton)
            return
        }
        
        guard shouldRefreashToken else {
            compleiton(refreshingToken)
            return
        }
        
//        guard let refreshToken = self.refreashToken else {
//            completion(true)
//            return
//        }
        
//        refresh token if needed
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        
        
        
        refreshingToken = true
        
        
        var components = URLComponents()
        components.queryItems = [
           URLQueryItem(name: "grant_type", value: "refreash_token"),
           URLQueryItem(name: "refreash_token", value: "refreash_token"),
          
            
        ]
        
        
      var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        let basicToken = Constants.clientID + ":" + Constants.clientSicret
        let data = basicToken.data(using: .utf8)
        guard let  base64String = data?.base64EncodedString() else {
            print("Failure to get base64 ")
            compleiton(false)
            return
            
            
        }
        
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
      let task =  URLSession.shared.dataTask(with: request) {[weak self] data, _, error  in
        self?.refreshingToken = false
            guard let data = data, error == nil else {
                compleiton(false)
                return
                
            }
        do{
            let result = try JSONDecoder().decode(AuthResponse.self, from: data)
//            self?.onRefreshBlocks.forEach { $0(result.access_token) }
            self?.onRefreshBlocks.removeAll()
            print("Successfully refreshed")
//             self?.cacheToken(result: result)
         
            compleiton(true)
        }catch{
            print(error.localizedDescription)
            compleiton(false)
        }
        
        
        
        
            
        }
        task.resume()
        
    }
        
        
        
        
        
        
        
        
    }
    
    
    
    private func cacheToken(result: AuthResponse) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
//         if let refresh_token = result.refresh_token {
            
        UserDefaults.standard.setValue(result.refresh_token, forKey: "refresh_token")
            
//       }
        
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey: "expirationDate")
    }
    
    
    
    
    
    
    

