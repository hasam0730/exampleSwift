//
//  Cells.swift
//  exampleSwift
//
//  Created by Developer on 1/25/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .orange
    }
}

class UserHeader: DatasourceCell {
    override func setupViews() {
        //        super.setupViews()
        backgroundColor = .blue
    }
}

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

class MasterCell: DatasourceCell {
    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "nguyen trung hieu"
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
    }
}
