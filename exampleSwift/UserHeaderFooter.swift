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
        self.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
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
        self.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
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

