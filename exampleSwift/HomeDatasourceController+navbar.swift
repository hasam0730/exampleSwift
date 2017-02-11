//
//  HomeDatasourceController+navbar.swift
//  exampleSwift
//
//  Created by Developer on 2/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupRightNavItems()
        setupRremainingNavItems()
    }
    //
    private func setupRremainingNavItems() {
        // title view
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame.size = CGSize(width: 35, height: 35)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        //
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
    }
    //
    private func setupLeftNavItem() {
        // follow button
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame.size = CGSize(width: 35, height: 35)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    //
    private func setupRightNavItems() {
        // search button
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame.size = CGSize(width: 35, height: 35)
        // composed button
        let composedButton = UIButton(type: .system)
        composedButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composedButton.frame.size = CGSize(width: 35, height: 35)
        //
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView : searchButton), UIBarButtonItem(customView : composedButton)]
    }
    //
}
