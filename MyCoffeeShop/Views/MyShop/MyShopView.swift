import SwiftUI
import CoreLocation

struct MyShopView: View {
    
    let locationCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: -25.859050,
        longitude: 28.349276)

    

    var body: some View {
        
        VStack {
            LottieView(lottieFile: "Store", loopMode: .playOnce)
                .frame(width: 200, height: 200)
            
        Divider()
            VStack(alignment: .leading) {
                Text("Address: Carlitas Laan")
                Text("Contact number: 0125481728")
            }
            Spacer()
            MapView(coordinate: locationCoordinate)
                .frame(height: 300)
            
        }
    }
}

