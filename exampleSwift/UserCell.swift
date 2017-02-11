//
//  UserCell.swift
//  exampleSwift
//
//  Created by Developer on 2/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            let user = datasourceItem as! User
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Brian Voong"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "raywenderlich")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "@buildthatapp"
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1.0)
        return usernameLabel
    }()
    
    let bioTextView: UITextView = {
        let biotextview = UITextView()
        biotextview.text = "iPhone, iPad, iOS Programming. Joint us to learn Swift, Objective-C and build iOS apps!"
        biotextview.font = UIFont.systemFont(ofSize: 15)
        biotextview.backgroundColor = .clear
        biotextview.isScrollEnabled = false
        biotextview.isEditable = false
        biotextview.isSelectable = false
        return biotextview
    }()
    
    let followButton: UIButton = {
        let followbtn = UIButton()
        followbtn.layer.cornerRadius = 5
        followbtn.clipsToBounds = true
        followbtn.imageView?.contentMode = .scaleAspectFit
        followbtn.layer.borderWidth = 1
        followbtn.setTitle("Follow", for: .normal)
        followbtn.layer.borderColor = twitterBlue.cgColor
        followbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        followbtn.setTitleColor(twitterBlue, for: .normal)
        followbtn.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        followbtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        
        return followbtn
    }()
    
    override func setupViews() {
        super.setupViews()
        //
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        //
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        //
        backgroundColor = .white
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
                             topConstant: 0,
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
                           topConstant: -2,
                           leftConstant: 4,
                           bottomConstant: 0,
                           rightConstant: 0,
                           widthConstant: 0,
                           heightConstant: 0)
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

