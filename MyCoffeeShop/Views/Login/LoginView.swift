//
//  LoginView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/30.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String
    @State private var password: String
    @State private var login: Bool
    @State private var rememberMe: Bool
    @ObservedObject var userModel: UserModel
    
    init(userModel: UserModel) {
        self.username = ""
        self.password = ""
        self.login = false
        self.rememberMe = false
        self.userModel = userModel
    }
    var body: some View {
        
        if ( userModel.loading == true )
        {
            LottieView(lottieFile: "loading", loopMode: .loop)
        }
        else
        {
            NavigationStack {
                VStack {
                    
                    LottieView(lottieFile: "Login", loopMode: .playOnce)
                        .frame(height: 200)
                    
                    GroupBox {
                        HStack {
                            Text( "Username:")
                            TextField("Username", text: $username)
                        }
            
                        HStack {
                            Text( "Password:")
                            SecureField("Password", text: $password)
                        }
                        
                        HStack {
                            CheckBoxView(checked: $rememberMe )
                            Text("Remember me")
                        }.padding()
                        
            
                        Button(role: .none, action: {
                            
                            userModel.loggedIn = true
             
                        })
                        {
                            Text("Login").frame(width: 200)
                        }
                        .buttonStyle(ColorButton(color: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/))
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: SignUpView(userModel: userModel)) {
                                Text("Sign up")
                                Image(systemName: "pencil")
                            }.accentColor(/*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.814, brightness: 0.555)/*@END_MENU_TOKEN@*/)
                            .padding()
                        }
                        
                        
            
                    } label: { Label("Login", systemImage: "person.fill") }.padding().shadow(radius: 8)
                        .groupBoxStyle(ColoredGroupBox(color: .white))
                }
            }
        }
    }
}

