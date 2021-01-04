//
//  Login.swift
//  06_faceID_Firebase
//
//  Created by emm on 04/01/2021.
//

import SwiftUI
import LocalAuthentication

//MARK: - Home
struct Login: View {
    
    @StateObject var LoginModel = LoginViewModel()
    
    @State var invisible = false
    
    // when first time user logged in via email store this for future biometric login...
    @AppStorage("stored_User") var Stored_User = ""
    @AppStorage("stored_Password") var Stored_Password = ""
    
    @AppStorage("status") var logged = false
    
    var body: some View {
        VStack {
//            Spacer(minLength: 0)
            Image("lightalien")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                
                //Dynamic Frame ...
//                .padding(.horizontal, 100)
                .padding(.vertical, 0)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("Please sign in to continue")
                        .foregroundColor(Color.primary.opacity(0.5))
                })
                Spacer(minLength: 0)
            } //hstack
            .padding()
            .padding(.leading, 15)
            HStack {
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .frame(width: 30)
                
                TextField("Email", text: $LoginModel.email)
                    .autocapitalization(.none)
                    .onReceive(KeybordManager.shared.$keyboardFrame) { keyboardFrame in
                                        if let keyboardFrame = keyboardFrame, keyboardFrame != .zero {
                                            self.invisible = false
                                        } else {
                                            self.invisible = true
                                        }
                                }
                    .onTapGesture {
                        self.hideKeyBoard()
                    }
            } //hstack
            .padding()
            .background(Color.primary.opacity(LoginModel.email == "" ? 0 : 0.10))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .frame(width: 30)
                
                SecureField("Password", text: $LoginModel.password)
                    .autocapitalization(.none)
            } //hstack
            .padding()
            .background(Color.primary.opacity(LoginModel.password == "" ? 0 : 0.10))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15) {
                Button(action: LoginModel.verifyUser, label: {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 200)
                        .background(Color("green"))
                        .clipShape(Capsule())
                })
                .opacity(LoginModel.email != "" && LoginModel.password != "" ? 1 : 1)
                .disabled(LoginModel.email != "" && LoginModel.password != "" ? false : true)
                
                if LoginModel.getBiometricStatus() {
                    Button(action: LoginModel.authenticateUser, label: {
                        // getting biometrictype ...
                        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.primary)
                            .padding()
                            .background(Color("greem"))
                            .clipShape(Circle())
                    })
                }
            } //hstack
            .padding(.top)
            
            
            
            //////////////// start when  keyboard actif  hiding stuff
            
            
            //signUp
            if self.invisible {
                //forget button
                Button(action: {}, label: {
                    Text("Forget password?")
                        .foregroundColor(Color("green"))
                })
                .padding(.top, 5)
                Spacer(minLength: 0)
                
                HStack(spacing: 6) {
                    Text("Don't have an account yet ?")
                        .foregroundColor(Color.primary.opacity(0.6))
                    
                    Button(action: {}, label: {
                        Text("SignUp")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("green"))
                    })
                    
                }
                .padding(.vertical, 2)
            }else {
                EmptyView()
            }

            //////////////// end  when  keyboard actif  hiding stuff
            
            
        }//vstack
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
        .alert(isPresented: $LoginModel.alert, content: {
            Alert(title: Text("Error"), message: Text(LoginModel.alertMsg), dismissButton: .destructive(Text("ok")))
        })
    }// body
    
}
