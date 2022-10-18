//
//  SplashScreen.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/28.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
        
    var body: some View {
        VStack {
            LottieView(lottieFile: "CoffeeCup", loopMode: .loop )
        }
        
    }
}
