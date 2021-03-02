//
//  AlbumViewController.swift
//  muzlit
//
//  Created by turbo on 02.03.2021.
//

import UIKit

class AlbumViewController: UIViewController {

    
    
    
    
    
    private let album: Album
    
    
    
    init(album: Album) {
           self.album = album
           super.init(nibName: nil, bundle: nil)
       }

       required init?(coder: NSCoder) {
           fatalError()
       }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
