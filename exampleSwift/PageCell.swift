//
//  CollectionCell.swift
//  exampleSwift
//
//  Created by Developer on 2/17/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        imageView.clipsToBounds = true
    }
    
    let imageView: UIImageView = {
       let imgv = UIImageView()
        imgv.image = UIImage(named: "page1")
        imgv.contentMode = .scaleAspectFill
        return imgv
    }()
    
}
