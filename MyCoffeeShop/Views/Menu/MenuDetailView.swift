//
//  MenuDetailView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/28.
//

import SwiftUI

struct MenuDetailView: View {
    @State var sliderValue: Float = 0.0
    
    var body: some View {
        VStack {
            CircleImage(image: Image(uiImage: UIImage(named: "CoffeeCup_1").unsafelyUnwrapped).resizable())
                .frame(width: 200, height: 200)
                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                .padding()
            Divider()
            
            Text("Item details")
            HStack {
                Text("Item price: R12")
                Spacer()
            }
            
            Slider(value: $sliderValue, in: 0...10, step: 1) {
            } minimumValueLabel: {
                Text("0").font(.title2).fontWeight(.thin)
            } maximumValueLabel: {
                Text("10").font(.title2).fontWeight(.thin)
            }
            .padding()
            .tint(.blue)
            Text("Quantity \(Int(sliderValue))")
            Text("Total price: R120" )
            
            Spacer()
            Button(role: .none, action: {})
            {
                Label("Add to cart", systemImage: "cart")
            }
            .buttonStyle(ColorButton(color: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/))
            .padding()
        }
        .navigationTitle("Americano Coffee")
    }
}



