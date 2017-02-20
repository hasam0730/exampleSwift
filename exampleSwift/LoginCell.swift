//
//  LoginCell.swift
//  exampleSwift
//
//  Created by Developer on 2/19/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        //
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -190, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        //
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        //
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    //MARK: 
    let logoImageView: UIImageView = {
        let imgLogo = UIImageView()
        imgLogo.image = UIImage(named: "logo")
        return imgLogo
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let txtField = LeftPaddedTextField()
        txtField.placeholder = "Enter email"
        txtField.layer.borderColor = UIColor.lightGray.cgColor
        txtField.layer.borderWidth = 1
        txtField.keyboardType = .emailAddress
        return txtField
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let txtField = LeftPaddedTextField()
        txtField.placeholder = "Enter password"
        txtField.layer.borderColor = UIColor.lightGray.cgColor
        txtField.layer.borderWidth = 1
        txtField.keyboardType = .default
        txtField.isSecureTextEntry = false
        return txtField
    }()
    
    let loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
}

class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
