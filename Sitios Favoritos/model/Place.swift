//
//  Place.swift
//  Sitios Favoritos
//
//  Created by Hernán Rodríguez on 4/8/24.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable {
    let id: UUID
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case latitude
        case longitude
        case fav
    }
    
    init(id: UUID = UUID(), name: String, coordinates: CLLocationCoordinate2D, fav: Bool) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.fav = fav
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        name = try container.decode(String.self, forKey: .name)
        fav = try container.decode(Bool.self, forKey: .fav)
        id = try container.decode(UUID.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
        try container.encode(fav, forKey: .fav)
    }
}
