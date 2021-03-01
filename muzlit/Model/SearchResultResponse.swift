//
//  SearchResultResponse.swift
//  muzlit
//
//  Created by turbo on 01.03.2021.
//

import Foundation


struct SearchResultsResponse: Codable {
    let albums: SearchAlbumResponse
    let artists: SearchArtistsResponse
    let playlists: SearchPlaylistsResponse
    let tracks: SearchTrackssResponse
}

struct SearchAlbumResponse: Codable {
    let items: [Album]
}

struct SearchArtistsResponse: Codable {
    let items: [Artist]
}

struct SearchPlaylistsResponse: Codable {
    let items: [Playlist]
}

struct SearchTrackssResponse: Codable {
 let items: [AudioTrack]
}

