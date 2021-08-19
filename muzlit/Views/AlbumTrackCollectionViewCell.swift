//
//  AlbumTrackCollectionViewCell.swift
//  muzlit
//
//  Created by Anton Tuzov  on 02.03.2021.
//

import UIKit


class AlbumTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumTrackCollectionViewCell"
    
    
    
    
    lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .thin)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        trackNameLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.width-15,
            height: contentView.height/2
        )
        artistNameLabel.frame = CGRect(
            x: 10,
            y: contentView.height/2,
            width: contentView.width-15,
            height: contentView.height/2
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        artistNameLabel.text = nil
    }

    func configure(with viewModel: AlbumCollectionViewCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
    }
    
    
    
    
    
    
    
    
    
    
}
