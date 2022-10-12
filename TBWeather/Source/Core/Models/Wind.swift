//
//  Wind.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

struct Wind: Decodable {
    let speed: Double
    let degrees: Double
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}
