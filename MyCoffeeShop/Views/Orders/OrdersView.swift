//
//  OrdersView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/28.
//

import SwiftUI

struct OrdersView: View {
    @State private var searchString: String
    @State private var gridLayout: [GridItem]
    @State private var fakeData: [FakeData]
    
    
    init() {
        let coordinates = Coordinates(latitude: -25.859050, longitude: 28.349276)
        self.gridLayout = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
        self.fakeData = [FakeData(id: UUID().uuidString, name: "Iced Coffees", image: UIImage(named: "CoffeeCup_2").unsafelyUnwrapped,  coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Soft Drinks", image: UIImage(named: "CoffeeCup_3").unsafelyUnwrapped, coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Cofees", image: UIImage(named: "CoffeeCup_5").unsafelyUnwrapped, coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Teas", image: UIImage(named: "CoffeeCup_6").unsafelyUnwrapped, coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Desserts", image: UIImage(named: "Dessert_1").unsafelyUnwrapped, coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Sushi", image: UIImage(named: "Sushi_1").unsafelyUnwrapped, coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Breakfast", image: UIImage(named: "Egg_1").unsafelyUnwrapped, coordinates: coordinates ),
                         FakeData(id: UUID().uuidString, name: "Pizzas", image: UIImage(named: "Pizza_1").unsafelyUnwrapped, coordinates: coordinates )
                         
        
        ]
        self.searchString = ""
    }
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    
                    /// Current Order
                    NavigationLink(destination: CheckOutView()) {
                        GroupBox{
                            VStack {
                                HStack {
                                    Text("Total items: 10").foregroundColor(.black)
                                    Spacer()
                                    Text("Total price: R120").foregroundColor(.black)
                                }.padding()
                                
                                Label("Go to checkout", systemImage: "cart")
//                                Button(role: .none, action: {})
//                                {
//                                    Label("Go to checkout", systemImage: "cart")
//                                }
//                                .buttonStyle(ColorButton(color: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/))
//                                .padding()
                            }
                            
                            
                        } label: {
                            Label("Current order", systemImage: "cart").foregroundColor(.black)
                        }
                        .groupBoxStyle(ColoredGroupBox(color: .white))
                        
                    }
                    .padding(.horizontal, 10)
                    .cornerRadius(5)
                    .shadow(radius: 2)
                    HStack {
                        Text("Previous orders").foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    List {
                        ForEach( fakeData ) { place in
                            NavigationLink(destination: MenuItemView())
                            {
                                VStack(alignment: .leading) {
                                    Text("Order date: 20/08/2022").foregroundColor(.black).bold()
                                    Text("Total items: 10").foregroundColor(.black)
                                    Text("Total price: R120").foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}

