//
//  TitleHeaderCollectionReusableView.swift
//  muzlit
//
//  Created by turbo on 01.03.2021.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    
    
    static let identifier = "TitleHeaderCollectionReusableView"
    

//    private let label: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.numberOfLines = 1
//        label.font = .systemFont(ofSize: 22, weight: .regular)
//        return label
//    }()
    
      var label = UILabel()
     
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
//        addSubview(label)
        
        nlabel()
    }

    
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    private func nlabel() {
        addSubview(label)
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.frame = CGRect(x: 15, y: 0, width: width-35, height: height)
    }
    
    
    
    
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        label.frame = CGRect(x: 15, y: 0, width: width-30, height: height)
    }

    func configure(with title: String) {
        label.text = title
    }
}
