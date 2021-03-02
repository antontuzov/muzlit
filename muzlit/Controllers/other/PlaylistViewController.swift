//
//  PlayListViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit

class PlaylistViewController: UIViewController {

    
    
    private let playlist: Playlist
    
    
    
    init(playlist:  Playlist) {
           self.playlist = playlist
           super.init(nibName: nil, bundle: nil)
       }

       required init?(coder: NSCoder) {
           fatalError()
       }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    
    
    
    
    
}
