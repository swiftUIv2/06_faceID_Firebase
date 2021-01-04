//
//  Home.swift
//  06_faceID_Firebase
//
//  Created by emm on 04/01/2021.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @AppStorage("status") var logged = false
    
    var body: some View {
        VStack(spacing: 15) {
            Text("User Logged In As \(Auth.auth().currentUser?.email ?? "")")
            Text("User Uid \(Auth.auth().currentUser?.uid ?? "")")
            
            Button(action: {
                try! Auth.auth().signOut()
                withAnimation { logged = false }
            }, label: {
                Text("LogOut")
                    .fontWeight(.heavy)
            })
        }
    }
}

