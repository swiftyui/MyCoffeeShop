//
//  MenuRowView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/29.
//

import SwiftUI

struct MenuRowView: View {
    var body: some View {
        
        NavigationLink(destination: MenuDetailView()) {
            HStack {
                CircleImage(image: Image(uiImage: UIImage(named: "CoffeeCup_1").unsafelyUnwrapped).resizable())
                    .frame(width: 64, height: 64)
                    .shadow(radius: 1)
                
                Text("Americano Coffee")
            }
        }
    }
}

