//
//  HomeDatasourceController.swift
//  exampleSwift
//
//  Created by Developer on 1/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeDatasourceController: DatasourceController {
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        //
        setupNavigationBarItems()
        // 
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
    }
    //
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
            //let's get an estimation of the height of our cell based on user.bioText
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            //
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            //
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50.0)
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 65.0)
    }
}
