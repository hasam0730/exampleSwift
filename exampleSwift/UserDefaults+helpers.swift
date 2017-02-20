//
//  UserDefaults+helpers.swift
//  exampleSwift
//
//  Created by Developer on 2/20/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        print(UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        print(bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue))
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
