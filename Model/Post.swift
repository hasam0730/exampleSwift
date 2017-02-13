//
//  File.swift
//  exampleSwift
//
//  Created by Developer on 2/13/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
//MARK: Model
class Post {
    var name: String?
    var imgProfile: UIImage?
    var statusText: String?
    var numLikes: Int?
    var numComment: Int?
    var statusImageUrl: String?
}

class Posts {
    private let postsList:[Post]
    init() {
        // 1
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.imgProfile = #imageLiteral(resourceName: "zuckprofile")
        postMark.statusText = "By giving people the power to share, we're making the world more transparent."
        postMark.numLikes = 200
        postMark.numComment = 1000
        postMark.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/mark_zuckerberg_background.jpg"
        // 2
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.imgProfile = #imageLiteral(resourceName: "steve_status")
        postSteve.statusText =  "Design is not just what it looks like and feels like. Design is how it works.\n\n" +
                                "Being the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful," +
                                "that's what matters to me.\n\n" +
                                "Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations."
        postSteve.numLikes = 400
        postSteve.numComment = 2000
        postSteve.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/steve_jobs_background.jpg"
        // 3
        let JohnSteve = Post()
        JohnSteve.name = "John Steve"
        JohnSteve.imgProfile = #imageLiteral(resourceName: "steve_status")
        JohnSteve.statusText =  "Live as if you were to die tomorrow; learn as if you were to live forever.\n" +
                                "The weak can never forgive. Forgiveness is the attribute of the strong.\n" +
                                "Happiness is when what you think, what you say, and what you do are in harmony."
        JohnSteve.numLikes = 400
        JohnSteve.numComment = 2000
        JohnSteve.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        //
        postsList.append(postMark)
        postsList.append(postSteve)
        postsList.append(JohnSteve)
    }
}
