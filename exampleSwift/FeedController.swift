//
//  ViewController.swift
//  exampleSwift
//
//  Created by Developer on 12/31/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Facebook Feed"
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}

class FeedCell: UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        //
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        //
        addContraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addContraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addContraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addContraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentLabel)
        addContraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addContraintsWithFormat(format: "H:|-8-[v0]|", views: likeButton)
        addContraintsWithFormat(format: "V:|-8-[v0]", views: nameLabel)
        addContraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-4-[v3(30)]-4-[v4(0.4)]-4-[v5(44)]|", views: profileImageView, statusTextView, statusImageView, likesCommentLabel, dividerLineView, likeButton)
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        //
        let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\nDecember - 18 * San Francisco", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
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
        label.numberOfLines = 2
        label.attributedText = attributedText
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "zuckprofile")
        return imgView
    }()
    
    let statusTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Meanwhile, Beast turned to the dark side"
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
        //
        let attributeText = NSMutableAttributedString(string: "488 likes    10.7k comments", attributes: [NSForegroundColorAttributeName: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1), NSFontAttributeName: UIFont.systemFont(ofSize: 19)])
        //
        label.attributedText = attributeText
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let dividerLineView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 220, green: 220, blue: 220)
        return view
    }()
    
    let likeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Like", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 220, green: 200, blue: 200), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(6, 6, 0, 0)
        return button
    }()
    
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


