//
//  ContentView.swift
//  lesson6.4
//
//  Created by Javlonbek on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var defs = Defs()
    
    @State var text = "No data"
    
    init() {
//        print(Defaults.loadName())
//        Defaults.storeName(name: "PDP Online")
//        print(Defaults.loadName())
//        print(Defaults.loadUser() as Any)
//        Defaults.storeUser(user: User(email: "javlonbek@gmail.com", password: "jav1234"))
//        print(Defaults.loadUser() as Any)
//        print(defs.name)
//        defs.name = "PDP Academy"
//        print(defs.name)
        print(defs.loadUser() as Any)
        let user = User(email: "javlonbek@gmail.com", password: "jav1234")
        defs.user = user
        print(defs.loadUser() as Any)
    }
    
    var body: some View {
        Text(defs.loadUser()!.password).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

