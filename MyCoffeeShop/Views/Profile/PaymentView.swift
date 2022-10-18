//
//  PaymentView.swift
//  MyCoffeeShop
//
//  Created by Arno van Zyl on 2022/10/03.
//

import SwiftUI

struct PaymentView: View {
    @State var product: [Products] = []
    @State var paymentSuccess = false
    @State var payHandler = PaymentHandler()
    var body: some View {
        
        ApplePayButton(action: {
            payHandler.startPayment(products: product, total: 12.2 ) { success in
                self.paymentSuccess = success
                self.product = []
            }
            
        })
    }
        

}
