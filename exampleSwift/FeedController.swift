//
//  ViewController.swift
//  exampleSwift
//
//  Created by Developer on 12/31/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit


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
        postMark.statusText = "Contrary to popular belief, Lorem Ipsum is not simply random"
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
        
        collectionView!.backgroundColor = UIColor.rgb(red: 200, green: 200, blue: 200)
        
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




