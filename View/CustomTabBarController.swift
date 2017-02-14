//
//  CustomTabBarController.swift
//  exampleSwift
//
//  Created by Developer on 2/14/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let firstNavigationController = UINavigationController(rootViewController: feedController)
        firstNavigationController.title = "News Feed"
        firstNavigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        // 2
        let friendRequestController = FriendRequestController()
        let secondNavigationController = UINavigationController(rootViewController: friendRequestController)
        secondNavigationController.title = "Requests"
        secondNavigationController.tabBarItem.image = UIImage(named: "requests_icon")
        // 3
        let messController = MessengersController()
        let thirdNavigationController = UINavigationController(rootViewController: messController)
        thirdNavigationController.title = "Messengers"
        thirdNavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        // 4
        let NotifiController = NotificationController()
        let fourthNavigationController = UINavigationController(rootViewController: NotifiController)
        fourthNavigationController.title = "Notifcations"
        fourthNavigationController.tabBarItem.image = UIImage(named: "globe_icon")
        // 5
        let moreController = MoreController()
        let fifthNavigationController = UINavigationController(rootViewController: moreController)
        fifthNavigationController.title = "Something"
        fifthNavigationController.tabBarItem.image = UIImage(named: "more_icon")
        //
        viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController, fourthNavigationController, fifthNavigationController]
        tabBar.isTranslucent = false
        //
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        tabBar.layer.addSublayer(topBorder)
//        tabBar.clipsToBounds = true
    }
}

class MessengersController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.navigationItem.title = "Messenger"
    }
}

class NotificationController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.navigationItem.title = "Notification"
    }
}

class MoreController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.navigationItem.title = "Something"
    }
}
