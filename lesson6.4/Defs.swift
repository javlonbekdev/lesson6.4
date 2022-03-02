//
//  Defs.swift
//  lesson6.4
//
//  Created by Javlonbek on 31/01/22.
//

import Foundation

//class Defs: ObservableObject {
//    @Published var name: String {
//        didSet {
//            UserDefaults.standard.set(name, forKey: "name")
//        }
//    }
//
//    init() {
//        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
//    }
//}

class Defs: ObservableObject {
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    @Published var user: User? {
        didSet {
            storeUser(user: user!)
        }
    }
    
    init() {
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
        self.user = loadUser()
    }
    
    func storeUser(user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: "user")
        }
    }
    
    func loadUser() -> User! {
        if let savedUserData = UserDefaults.standard.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                return savedUser
            }
        }
        return nil
    }
}
