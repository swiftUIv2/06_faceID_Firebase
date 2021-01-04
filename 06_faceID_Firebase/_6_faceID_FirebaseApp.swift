//
//  _6_faceID_FirebaseApp.swift
//  06_faceID_Firebase
//
//  Created by emm on 02/01/2021.
//

import SwiftUI
import Firebase

@main
struct _6_faceID_FirebaseApp: App {
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    // Initializing Firebase...
    class Delegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            return true
        }
    }
    
}
