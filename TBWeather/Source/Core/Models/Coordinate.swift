//
//  Coordinate.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

struct Coordinate: Decodable {
    let longitude: Double
    let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
