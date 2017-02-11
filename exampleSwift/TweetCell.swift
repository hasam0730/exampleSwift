//
//  TweetCell.swift
//  exampleSwift
//
//  Created by Developer on 2/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import LBTAComponents
class TweetCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            //
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            //
            attributedText.append(NSAttributedString(string: " " + tweet.user.username + "\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName: UIColor.darkGray]))
            //
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 6
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            messageTextView.attributedText = attributedText
            //
            profileImageView.image = tweet.user.profileImage
            messageTextView.attributedText = attributedText
        }
    }
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 200, g: 200, b: 200)
        backgroundColor = .white
        // 1
        addSubview(messageTextView)
        addSubview(profileImageView)
        addSubview(replyButton)
        // 2
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
        // 3
        messageTextView.anchor(topAnchor,
                               left: profileImageView.rightAnchor,
                               bottom: bottomAnchor,
                               right: rightAnchor,
                               topConstant: 4,
                               leftConstant: 0,
                               bottomConstant: 0,
                               rightConstant: 0,
                               widthConstant: 0,
                               heightConstant: 0)
        setupBottomButtons()
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "raywenderlich")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let replyButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
       return button
    }()
    
    let retweetButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let directMessButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    let messageTextView: UITextView = {
       let messageTextView = UITextView()
        messageTextView.text = "some sample text"
        messageTextView.backgroundColor = .clear
        messageTextView.isScrollEnabled = false
        return messageTextView
    }()
    
    fileprivate func setupBottomButtons() {
        // 1
        let replyButtonContainerView = UIView()
        // 2
        let retweetButtonContainerView = UIView()
        // 3
        let likeButtonContainerView = UIView()
        // 4
        let directMessageButtonContainerView = UIView()
        // 5
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        // 6
        addSubview(buttonStackView)
        buttonStackView.anchor(nil,
                               left: messageTextView.leftAnchor,
                               bottom: self.bottomAnchor,
                               right: self.rightAnchor,
                               topConstant: 0,
                               leftConstant: 0,
                               bottomConstant: 5,
                               rightConstant: 0,
                               widthConstant: 0,
                               heightConstant: 20)
        // 7
        addSubview(replyButton)
        replyButton.anchor(replyButtonContainerView.topAnchor,
                           left: replyButtonContainerView.leftAnchor,
                           bottom: nil,
                           right: nil,
                           topConstant: 0,
                           leftConstant: 0,
                           bottomConstant: 0,
                           rightConstant: 0,
                           widthConstant: 20,
                           heightConstant: 20)
        // 8
        addSubview(retweetButton)
        retweetButton.anchor(retweetButtonContainerView.topAnchor,
                             left: retweetButtonContainerView.leftAnchor,
                             bottom: nil,
                             right: nil,
                             topConstant: 0,
                             leftConstant: 0,
                             bottomConstant: 0,
                             rightConstant: 0,
                             widthConstant: 20,
                             heightConstant: 20)
        // 9
        addSubview(likeButton)
        likeButton.anchor(likeButtonContainerView.topAnchor,
                          left: likeButtonContainerView.leftAnchor,
                          bottom: nil,
                          right: nil,
                          topConstant: 0,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: 20,
                          heightConstant: 20)
        // 10
        addSubview(directMessButton)
        directMessButton.anchor(directMessageButtonContainerView.topAnchor,
                                left: directMessageButtonContainerView.leftAnchor,
                                bottom: nil,
                                right: nil,
                                topConstant: 0,
                                leftConstant: 0,
                                bottomConstant: 0,
                                rightConstant: 0,
                                widthConstant: 20,
                                heightConstant: 20)
    }
}
