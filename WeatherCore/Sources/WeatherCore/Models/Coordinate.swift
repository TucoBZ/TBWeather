//
//  Coordinate.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Coordinate: Decodable {
    public let longitude: Double
    public let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
    
    public init( longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}
