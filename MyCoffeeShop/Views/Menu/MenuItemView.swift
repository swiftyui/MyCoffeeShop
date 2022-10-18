//
//  MenuItemView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/28.
//

import SwiftUI

struct MenuItemView: View {
    @State private var searchString: String
    
    init() {
        self.searchString = ""
    }
    
    var body: some View {
        
        LottieView(lottieFile: "CoffeeCup2", loopMode: .loop)
        SearchBar(searchString: $searchString)
        List {
            MenuRowView()
            
            MenuRowView()
        }
    }
}
