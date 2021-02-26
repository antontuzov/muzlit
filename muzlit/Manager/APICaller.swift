//
//  APICaller.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    
    private init() {}
    
    public func getCurrentUserProfile(completion: @escaping (Result<userProfile, Error>) -> Void) {
        
        
    }
    
}
