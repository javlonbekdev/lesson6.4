//
//  Defaults.swift
//  lesson6.4
//
//  Created by Javlonbek on 31/01/22.
//

import Foundation

struct Defaults {
    static let defaults = UserDefaults.standard
    
    static func storeName(name: String) {
        defaults.set(name, forKey: "name")
    }
    
    static func loadName() -> String {
        return defaults.object(forKey: "name") as? String ?? "no data yet"
    }
    
    static func storeUser(user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            defaults.set(encodedUser, forKey: "user")
        }
    }
    
    static func loadUser() -> User! {
        if let savedUserData = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                return savedUser
            }
        }
        return nil
    }
}
