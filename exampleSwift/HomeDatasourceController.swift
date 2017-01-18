//
//  HomeDatasourceController.swift
//  exampleSwift
//
//  Created by Developer on 1/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import LBTAComponents

class UserCell: DatasourceCell {
    
    let nameLabel:UILabel = {
       let label = UILabel()
        label.text = "TEST TEST TEST"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         topConstant: 0,
                         leftConstant: 0,
                         bottomConstant: 0,
                         rightConstant: 0,
                         widthConstant: 0,
                         heightConstant: 0)
    }
}

class HomeDatasource: Datasource {
    let words = ["user1", "user2", "user3"]
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.row]
    }
}

class HomeDatasourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
}
