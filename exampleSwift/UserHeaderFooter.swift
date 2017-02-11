//
//  Cells.swift
//  exampleSwift
//
//  Created by Developer on 1/25/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import LBTAComponents
class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        //
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        whiteBackgroundView.anchor(topAnchor,
                                   left: leftAnchor,
                                   bottom: bottomAnchor,
                                   right: rightAnchor,
                                   topConstant: 0,
                                   leftConstant: 0,
                                   bottomConstant: 15,
                                   rightConstant: 0,
                                   widthConstant: 0,
                                   heightConstant: 0)
        //
        textLabel.anchor(topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         topConstant: 0,
                         leftConstant: 12,
                         bottomConstant: 14,
                         rightConstant: 0,
                         widthConstant: 0,
                         heightConstant: 0)
    }
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Show me more..."
        textLabel.textColor = twitterBlue
        textLabel.font = UIFont.systemFont(ofSize: 15)
        
        return textLabel
    }()

}

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(textLabel)
        textLabel.anchor(topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         topConstant: 0,
                         leftConstant: 12,
                         bottomConstant: 0,
                         rightConstant: 0,
                         widthConstant: 0,
                         heightConstant: 0)
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 255, g: 255, b: 255)
    }
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "WHO TO FOLLOW"
        textLabel.font = UIFont.systemFont(ofSize: 16)
        return textLabel
    }()
}

