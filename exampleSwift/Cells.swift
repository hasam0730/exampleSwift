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
        backgroundColor = .orange
    }
}

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserCell: DatasourceCell {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "TEST TEST TEST"
        label.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "username"
        usernameLabel.backgroundColor = .purple
        return usernameLabel
    }()
    
    let bioTextView: UITextView = {
       let biotextview = UITextView()
        biotextview.text = ""
        biotextview.backgroundColor = .yellow
        return biotextview
    }()
    
    let followButton: UIButton = {
        let followbtn = UIButton()
        followbtn.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        return followbtn
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        //
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
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
        //
        
        nameLabel.anchor(profileImageView.topAnchor,
                         left: profileImageView.rightAnchor,
                         bottom: nil,
                         right: followButton.leftAnchor,
                         topConstant: 0,
                         leftConstant: 8,
                         bottomConstant: 0,
                         rightConstant: 8,
                         widthConstant: 0,
                         heightConstant: 20)
        //
        
        usernameLabel.anchor(nameLabel.bottomAnchor,
                        left: profileImageView.rightAnchor,
                        bottom: nil,
                        right: nameLabel.rightAnchor,
                        topConstant: 8,
                        leftConstant: 8,
                        bottomConstant: 0,
                        rightConstant: 0,
                        widthConstant: 0,
                        heightConstant: 20)
        //
        
        bioTextView.anchor(usernameLabel.bottomAnchor,
                           left: profileImageView.rightAnchor,
                           bottom: nil,
                           right: rightAnchor,
                           topConstant: 0,
                           leftConstant: 8,
                           bottomConstant: 0,
                           rightConstant: 0,
                           widthConstant: 0,
                           heightConstant: 100)
        //
        
        followButton.anchor(topAnchor,
                            left: nil,
                            bottom: nil,
                            right: rightAnchor,
                            topConstant: 12,
                            leftConstant: 0,
                            bottomConstant: 0,
                            rightConstant: 12,
                            widthConstant: 120,
                            heightConstant: 34)
    }
}

class MasterCell: DatasourceCell {
    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "nguyen trung hieu"
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
    }
}
