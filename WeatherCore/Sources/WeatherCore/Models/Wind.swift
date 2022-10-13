//
//  Wind.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Wind: Decodable {
    public let speed: Double
    public let degrees: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}