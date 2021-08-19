//
//  NewReleaseCollectionViewCell.swift
//  muzlit
//
//  Created by Anton Tuzov  on 01.03.2021.
//

import UIKit
import SDWebImage

class NewReleaseCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewReleaseCollectionViewCell"

    lazy var  albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        
        
        
        return label
    }()
    
    lazy var numberOfTracksLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.tintColor = .gray
        
        
        return label
    }()
    
    lazy var  artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.tintColor = .gray
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(numberOfTracksLabel)
        contentView.addSubview(artistNameLabel)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height-10
                let albumLabelSize = albumNameLabel.sizeThatFits(
                    CGSize(
                        width: contentView.width-imageSize-10,
                        height: contentView.height-10
                    )
                )
                artistNameLabel.sizeToFit()
                numberOfTracksLabel.sizeToFit()

                // Image
                albumCoverImageView.frame = CGRect(x: 5, y: 5, width: imageSize, height: imageSize)

                // Album name label
                let albumLabelHeight = min(60, albumLabelSize.height)
                albumNameLabel.frame = CGRect(
                    x: albumCoverImageView.right+10,
                    y: 5,
                    width: albumLabelSize.width,
                    height: albumLabelHeight
                )

                artistNameLabel.frame = CGRect(
                    x: albumCoverImageView.right+10,
                    y: albumNameLabel.bottom,
                    width: contentView.width - albumCoverImageView.right-10,
                    height: 30
                )

                numberOfTracksLabel.frame = CGRect(
                    x: albumCoverImageView.right+10,
                    y: contentView.bottom-44,
                    width: numberOfTracksLabel.width,
                    height: 44
                )
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumNameLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    
    
    func configure(with viewModel: NewReleasesCellViewModel) {
           albumNameLabel.text = viewModel.name
           artistNameLabel.text = viewModel.artistName
           numberOfTracksLabel.text = "Tracks: \(viewModel.numberOfTracks)"
           albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
       }
    
    
    
}
