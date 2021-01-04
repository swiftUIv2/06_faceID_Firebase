//
//  LoginViewModel.swift
//  06_faceID_Firebase
//
//  Created by emm on 04/01/2021.
//

import SwiftUI
import LocalAuthentication
import Firebase


class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    // for alerts
    @Published var alert = false
    @Published var alertMsg = ""
    
    // User Data...
    @AppStorage("stored_User") var Stored_User = ""
    @AppStorage("stored_Password") var Stored_Password = ""
    @AppStorage("status") var logged = false
    
    
    // getting biometricType....
    func getBiometricStatus()-> Bool {
        
        let scanner = LAContext()
        if email == Stored_User && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        return false
    }
    
    // authenticate user ...
    func authenticateUser() {
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unlock \(email)") {(status, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            // setting logged status as true
            
        }
    }
    
    // Verifying User ...
    func verifyUser(){
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            
            if let error = err {
                self.alertMsg = error.localizedDescription
                self.alert.toggle()
                return
            }
            
            // Success
            print("success")
            
        }
    }
}
