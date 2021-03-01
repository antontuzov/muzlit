//
//  ViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit


enum BrowseSectionType {
    case newReleases(viewModels: [NewReleasesCellViewModel]) // 1
    case featuredPlaylists(viewModels: [FeaturedPlaylistCellViewModel]) // 2
    case recommendedTracks(viewModels: [RecommendedTrackCellViewModel]) // 3
    var title: String {
        switch self {
        case .newReleases:
            return "New Released Albums"
        case .featuredPlaylists:
            return "Featured Playlists"
        case .recommendedTracks:
            return "Recommended"
        }
    }
}



class HomeViewController: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        
        fetchData()
        
    }
    
    
    @objc private func didTapSettings() {
      let vc = SettingsViewController()
      vc.title = "Settings"
      vc.navigationItem.largeTitleDisplayMode = .never
      navigationController?.pushViewController(vc, animated: true)
      
      
  }

    
    
    

    private func fetchData() {
        let group = DispatchGroup()
            group.enter()
            group.enter()
            group.enter()
            var newReleases: NewReleasesResponse?
            var featuredPlaylist: FeaturedPlaylistsResponse?
            var recommendations: RecommendationsResponse?
    
        
        
        // New Releases
        APICaller.shared.getNewReleases { result in
           
            defer {
                group.leave()
            }
            switch result {
            case .success(let model):
                 newReleases = model
            case .failure(let error):
              
              print(error.localizedDescription)

            }
            
            
        }
        // Featured Playlists
                APICaller.shared.getFeaturedPlaylists { result in
                    defer {
                        group.leave()
                    }

                    switch result {
                    case .success(let model):
                        featuredPlaylist = model
                    case .failure(let error):
                        print(error.localizedDescription)

                    }
                }

                // Recommended Tracks
                APICaller.shared.gerRecommendedGenres { result in
                    switch result {
                    case .success(let model):
                        let genres = model.genres
                        var seeds = Set<String>()
                        while seeds.count < 5 {
                            if let random = genres.randomElement() {
                                seeds.insert(random)
                            }
                        }

                        APICaller.shared.getRecommendations(genres: seeds) { recommendedResult in
                            defer {
                                group.leave()
                            }

                            switch recommendedResult {
                            case .success(let model):
                                recommendations = model

                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }

                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }

                group.notify(queue: .main) {
                    guard let newAlbums = newReleases?.albums.items,
                          let playlists = featuredPlaylist?.playlists.items,
                          let tracks = recommendations?.tracks else {
                        fatalError("Models are nil")
                    }
                    self.configureModels(
                        newAlbums: newAlbums,
                        playlists: playlists,
                        tracks: tracks
                    )
                }
//            }
//    private func configureModels(
//           newAlbums: [Album],
//           playlists: [Playlist],
//           tracks: [AudioTrack]
//       ) {
//           self.newAlbums = newAlbums
//           self.playlists = playlists
//           self.tracks = tracks
//           sections.append(.newReleases(viewModels: newAlbums.compactMap({
//               return NewReleasesCellViewModel(
//                   name: $0.name,
//                   artworkURL: URL(string: $0.images.first?.url ?? ""),
//                   numberOfTracks: $0.total_tracks,
//                   artistName: $0.artists.first?.name ?? "-"
//               )
//           })))
//        sections.append(.featuredPlaylists(viewModels: playlists.compactMap({
//                    return FeaturedPlaylistCellViewModel(
//                        name: $0.name,
//                        artworkURL: URL(string: $0.images.first?.url ?? ""),
//                        creatorName: $0.owner.display_name
//                    )
//                })))
//
//                sections.append(.recommendedTracks(viewModels: tracks.compactMap({
//                    return RecommendedTrackCellViewModel(
//                        name: $0.name,
//                        artistName: $0.artists.first?.name ?? "-",
//                        artworkURL: URL(string: $0.album?.images.first?.url ?? "")
//                    )
//                })))
//
//                collectionView.reloadData()
//            }

    
      
    }
}
    



