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
    
    
    
    var  nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var ownerLabel = UILabel()
    var imageView = UIImageView()
    var playAllButton = UIButton()
    
    
    
  
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .systemBackground
            setNameLabel()
            setdescriptionLabel()
            setownerLabel()
            setimageView()
            setplayAllButton()
        
        }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func didTapPlayAll() {
           delegate?.playlistHeaderCollectionReusableViewDidTapPlayAll(self)
       }

    
    
    
    private func setNameLabel(){
        addSubview(nameLabel)
        nameLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        nameLabel.frame = CGRect(x: 10, y: imageView.bottom, width: width-20, height: 44)
        
    }
     
    private func setdescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 1
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .regular)
//        descriptionLabel.frame = CGRect(x: 10, y: nameLabel.bottom, width: width-20, height: 44)
    }
     
    private func setownerLabel() {
        addSubview(ownerLabel)
        ownerLabel.textColor = .secondaryLabel
        ownerLabel.font = .systemFont(ofSize: 18, weight: .light)
//        ownerLabel.frame = CGRect(x: 10, y: descriptionLabel.bottom, width: width-20, height: 44)
    }
    
    private func setimageView() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
//        let imageSize: CGFloat = height/1.8
//        imageView.frame = CGRect(x: (width-imageSize)/2, y: 20, width: imageSize, height: imageSize)
        
    }
    
    private func  setplayAllButton() {
        addSubview(playAllButton)
        playAllButton.backgroundColor = .systemBlue
        playAllButton.tintColor = .white
        playAllButton.layer.masksToBounds = true
        playAllButton.layer.cornerRadius = 30
        let image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        playAllButton.setImage(image, for: .normal)
//        playAllButton.frame = CGRect(x: width-80, y: height-80, width: 60, height: 60)
        playAllButton.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = height/1.6
        imageView.frame = CGRect(x: (width-imageSize)/3.0, y: 30, width: imageSize, height: imageSize)

         nameLabel.frame = CGRect(x: 10, y: imageView.bottom, width: width-20, height: 40)
        descriptionLabel.frame = CGRect(x: 10, y: nameLabel.bottom, width: width-100, height: 40)
        ownerLabel.frame = CGRect(x: 10, y: descriptionLabel.bottom, width: width-20, height: 40)

        playAllButton.frame = CGRect(x: width-80, y: height-80, width: 60, height: 60)
    }
    
    
    func configure(with viewModel: PlaylistHeaderViewViewModel) {
            nameLabel.text = viewModel.name
            ownerLabel.text = viewModel.ownerName
            descriptionLabel.text = viewModel.description
            imageView.sd_setImage(with: viewModel.artworkURL, placeholderImage: UIImage(systemName: "photo"), completed: nil)
        }
    
    
}
