//
//  ViewController.swift
//  exampleSwift
//
//  Created by Developer on 12/31/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

//MARK: Model
class Post {
    var name: String?
    var imgProfile: UIImage?
    var statusText: String?
    var imgStatus: UIImage?
    var numLikes: Int?
    var numComment: Int?
}

//MARK: Controller
class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cell"
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.imgProfile = #imageLiteral(resourceName: "zuckprofile")
        postMark.statusText = "Meanwhile, Best turned to the dark side"
        postMark.imgStatus = #imageLiteral(resourceName: "gandhi_status")
        postMark.numLikes = 200
        postMark.numComment = 1000
        // 2
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.imgProfile = #imageLiteral(resourceName: "steve_status")
        postSteve.statusText = "Contrary to popular belief, Lorem Ipsum is not simply random text. \nIt has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. \nRichard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source"
        postSteve.imgStatus = #imageLiteral(resourceName: "zuckdog")
        postSteve.numLikes = 400
        postSteve.numComment = 2000
        // 2
        let JohnSteve = Post()
        JohnSteve.name = "John Steve"
        JohnSteve.imgProfile = #imageLiteral(resourceName: "steve_status")
        JohnSteve.statusText = "Contrary to popular belief, Lorem Ipsum is not simply random text. \nIt has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. \nRichard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source"
        JohnSteve.imgStatus = #imageLiteral(resourceName: "zuckdog")
        JohnSteve.numLikes = 400
        JohnSteve.numComment = 2000
        //
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(JohnSteve)
        
        navigationItem.title = "Facebook Feed"
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView!.backgroundColor = UIColor.rgb(red: 240, green: 240, blue: 240)
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        feedCell.post = posts[indexPath.row]
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = posts[indexPath.row].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
            let heightOrigin: CGFloat = 8 + 44 + 4 + 4 + 200 + 4 + 30 + 4 + 4 + 44 + 16
            return CGSize(width: view.frame.width, height: rect.height + heightOrigin)
        }
        return CGSize(width: view.frame.width, height: 500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

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

extension UIColor {
    class func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addContraintsWithFormat(format: String, views:UIView...) {
        var viewsDictionary = [String:UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDictionary))
    }
}


