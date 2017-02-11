//
//  TweetCell.swift
//  exampleSwift
//
//  Created by Developer on 2/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import LBTAComponents
class TweetCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 200, g: 200, b: 200)
        backgroundColor = .white
        //
        addSubview(profileImageView)
        //
        profileImageView.anchor(topAnchor,
                                left: leftAnchor,
                                bottom: nil,
                                right: nil,
                                topConstant: 12,
                                leftConstant: 12,
                                bottomConstant: 0,
                                rightConstant: 0,
                                widthConstant: 50,
                                heightConstant: 50)
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "raywenderlich")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
}
