//
//  Coordinate.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Coordinate: Codable, Equatable {
    public let longitude: Double
    public let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
    
    public init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
    public static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.longitude == rhs.longitude &&
        lhs.latitude == rhs.latitude
    }
}
