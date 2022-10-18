import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State var annotations: [FakeData] = []
    let coordinates = Coordinates(latitude: -25.859050, longitude: 28.349276)
    var body: some View {
        
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annotations) { _ in
            MapMarker(coordinate: coordinate, tint: .red)
        }
        .onAppear {
            setRegion(coordinate)
            annotations = [FakeData(id: UUID().uuidString, name: "Carlita's Restaurant", image: UIImage(named: "CarlitasRestaurant").unsafelyUnwrapped,  coordinates: coordinates )]
        }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) ///Set Zoom
        )
    }
}
