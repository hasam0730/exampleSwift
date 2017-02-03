//
//  Cells.swift
//  exampleSwift
//
//  Created by Developer on 1/25/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import LBTAComponents
let twitterBlue = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1.0)
class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
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
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "WHO TO FOLLOW"
        textLabel.font = UIFont.systemFont(ofSize: 16)
        return textLabel
    }()
}

class UserCell: DatasourceCell {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Brian Voong"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "avatar")
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
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
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
