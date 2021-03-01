//
//  LibraryAlbumsResponse.swift
//  muzlit
//
//  Created by turbo on 01.03.2021.
//

import Foundation



struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}



