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
        //
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // add line to navigationBar (top collection view)
        let navBarSeperatorView = UIView()
        navBarSeperatorView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.addSubview(navBarSeperatorView)
        navBarSeperatorView.anchor(view.topAnchor,
                                   left: view.leftAnchor,
                                   bottom: nil,
                                   right: view.rightAnchor,
                                   topConstant: 0,
                                   leftConstant: 0,
                                   bottomConstant: 0,
                                   rightConstant: 0,
                                   widthConstant: 0,
                                   heightConstant: 0.5)
        
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
