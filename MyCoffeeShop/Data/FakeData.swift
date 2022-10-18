
import Foundation
import SwiftUI
import CoreLocation

struct FakeData: Identifiable {
    var id: String
    var name: String
    var image: UIImage
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    init(id: String, name: String, image: UIImage, coordinates: Coordinates) {
        self.id = id
        self.name = name
        self.image = image
        self.coordinates = coordinates
    }

}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
