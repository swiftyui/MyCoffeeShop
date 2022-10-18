//
//  ExploreView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/09/29.
//

import SwiftUI

struct ExploreView: View {
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
                
                RefreshableScrollView {
                    
                    SearchBar(searchString: $searchString)
                    ForEach(fakeData) { data in
                        NavigationLink(destination: MenuView()) {
                            GroupBox {
                                Image("CarlitasRestaurant")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .frame(width: geo.size.width - 15, height: geo.size.height / 4 )
                                
                            }
                            .groupBoxStyle(ColoredGroupBox(color: .white))
                            .frame(width: geo.size.width - 15, height: geo.size.height / 4 )
                            .cornerRadius(8)
                            .shadow(radius: 5)
                        }
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Restaurants").font(.custom("Futura-Medium", size: 22))
                }
            }
        }

    }
}

