//
//  MyCoffeeShopApp.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/28.
//

import SwiftUI

@main
struct MyCoffeeShopApp: App {
    
    ///View variables
    @ObservedObject var userModel: UserModel
    @State var isLoading: Bool = true
    @State var timeRemaining = 2
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let count: Int = 1
    
    init() {
        
        /// Create startup variables
        self.userModel = UserModel()
        self.isLoading = true
        
        UITabBarItem.appearance().badgeColor = UIColor(/*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/)
    }
    
    var body: some Scene {
        WindowGroup {
            
            if (userModel.loggedIn == false )
            {
                LoginView(userModel: userModel)
            }
            else
            {
                if( isLoading == true )
                {
                    SplashScreen().onReceive(timer) {_ in
                        if ( timeRemaining > 0 )
                        {
                            timeRemaining -= 1
                        }
                        if (timeRemaining <= 0)
                        {
                            timer.upstream.connect().cancel()
                            isLoading = false
                        }
                    }
                }
                else
                {
                    TabView {
        
                        /// Add the Explore View
                        ExploreView().tabItem() {
                            Label("Explore", systemImage: "magnifyingglass")
                        }
        
                        /// Add the Orders View
                        OrdersView().tabItem() {
                            Label("Orders", systemImage: "checklist")
                        }.badge(count > 0 ? "\(count)" : nil)
                        
        
                        ProfileView(userModel: userModel).tabItem() {
                            Label("Profile", systemImage: "person.circle.fill")
                        }
        
                    }.accentColor(/*@START_MENU_TOKEN@*/Color(hue: 0.073, saturation: 0.898, brightness: 0.378)/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}
