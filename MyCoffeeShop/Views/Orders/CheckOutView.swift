//
//  CheckOutView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/10/04.
//

import SwiftUI

struct CheckOutView: View {
    var body: some View {
        LottieView(lottieFile: "payment", loopMode: .playOnce)
            .frame(height: 100)
        
        List {
            HStack {
                Image(systemName: "info.square")
                Text("Personal information")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
            .tint(Color.primary)
        }
    }
}

