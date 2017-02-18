//
//  CollectionCell.swift
//  exampleSwift
//
//  Created by Developer on 2/17/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            let color = UIColor(white: 0.2, alpha: 1)
            //
            let attributeText = NSMutableAttributedString(string: page.title!, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            attributeText.append(NSAttributedString(string: "\n\n" + page.message!, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: color]))
            //
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            //
            let length = attributeText.string.characters.count
            //
            attributeText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            self.textView.attributedText = attributeText
            self.imageView.image = UIImage(named: page.imageName!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeperatorView)
        //
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        lineSeperatorView.anchorToTop(nil, left: self.leftAnchor, bottom: textView.topAnchor, right: self.rightAnchor)
        lineSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "nguyen trung hieu"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsetsMake(24, 0, 0, 0)
        return tv
    }()
    
    let imageView: UIImageView = {
       let imgv = UIImageView()
        imgv.image = UIImage(named: "page1")
        imgv.contentMode = .scaleToFill
//        imgv.clipsToBounds = true
        return imgv
    }()
    
    let lineSeperatorView: UIView = {
        let seperatorView = UIView()
        seperatorView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return seperatorView
    }()
}
