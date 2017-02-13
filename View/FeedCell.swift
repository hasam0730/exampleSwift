//
//  File.swift
//  exampleSwift
//
//  Created by Developer on 2/13/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            if let nameUser = post?.name, let imageProfile = post?.imgProfile, let statusTxt = post?.statusText, let imageStatus = post?.imgStatus, let numbLikes = post?.numLikes, let numbComments = post?.numComment {
                //
                let attributedText = NSMutableAttributedString(string: nameUser, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
                attributedText.append(NSAttributedString(string: "\nDecember - 18 * San Francisco * ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
                //
                let parapraphStyle = NSMutableParagraphStyle()
                parapraphStyle.lineSpacing = 4
                //
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: parapraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                //
                let attachment = NSTextAttachment()
                attachment.image = #imageLiteral(resourceName: "globe_small")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                //
                nameLabel.attributedText = attributedText // set content nameLabel
                profileImageView.image = imageProfile // set content profileImage
                statusTextView.text = statusTxt // set content statusText
                statusImageView.image = imageStatus // set content statusImage
                //
                let str = String(format: "%d Likes      %d Comments", numbLikes, numbComments)
                let attributeText = NSMutableAttributedString(string: str, attributes: [NSForegroundColorAttributeName: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1), NSFontAttributeName: UIFont.systemFont(ofSize: 14)])
                likesCommentLabel.attributedText = attributeText
                //
            }
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        //
        self.backgroundColor = .white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        //
        addContraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addContraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addContraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addContraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentLabel)
        addContraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        //
        addContraintsWithFormat(format: "H:|[v0(v1)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        addContraintsWithFormat(format: "V:|-8-[v0]", views: nameLabel)
        //
        addContraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-4-[v3(30)]-4-[v4(0.4)]-4-[v5(44)]|", views: profileImageView, statusTextView, statusImageView, likesCommentLabel, dividerLineView, likeButton)
        addContraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addContraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
    
    var nameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        
        return imgView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "zuckdog")
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    let likesCommentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    let likeButton = FeedCell.buttonForTittle(title: "Like", imageName: #imageLiteral(resourceName: "like"))
    
    let commentButton = FeedCell.buttonForTittle(title: "Comment", imageName: #imageLiteral(resourceName: "comment"))
    
    let shareButton = FeedCell.buttonForTittle(title: "Share", imageName: #imageLiteral(resourceName: "share"))
    
    class func buttonForTittle(title: String, imageName: UIImage) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 157, green: 161, blue: 172), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(imageName.withRenderingMode(.alwaysOriginal), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0)
        return button
    }
}

