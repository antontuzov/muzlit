//
//  PlayList.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import Foundation


struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}

