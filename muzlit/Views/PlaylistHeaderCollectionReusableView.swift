//
//  PlaylistHeaderCollectionReusableView.swift
//  muzlit
//
//  Created by turbo on 04.03.2021.
//

import UIKit
import SDWebImage





protocol PlaylistHeaderCollectionReusableViewDelegate: AnyObject {
    func playlistHeaderCollectionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollectionReusableView)
}


final class PlaylistHeaderCollectionReusableView: UICollectionReusableView {
       static let identifier = "PlaylistHeaderCollectionReusableView"
    
    
    weak var delegate: PlaylistHeaderCollectionReusableViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
}
