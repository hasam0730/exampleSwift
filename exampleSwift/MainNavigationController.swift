//
//  MainNavigationController.swift
//  exampleSwift
//
//  Created by Developer on 2/20/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        if UserDefaults.standard.isLoggedIn() {
            let homeController = HomeViewController()
            viewControllers = [homeController]
        } else {
            perform(#selector(self.showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            
        })
    }
}
