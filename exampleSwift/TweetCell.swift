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
        //
        addSubview(messageTextView)
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
        //
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
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "raywenderlich")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let messageTextView: UITextView = {
       let messageTextView = UITextView()
        messageTextView.text = "some sample text"
        messageTextView.backgroundColor = .green
        messageTextView.isScrollEnabled = false
        return messageTextView
    }()
}
