//
//  Wind.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Wind: Codable, Equatable {
    public let speed: Double
    public let degrees: Int
    
    public init(speed: Double, degrees: Int) {
        self.speed = speed
        self.degrees = degrees
    }
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
    
    public static func == (lhs: Wind, rhs: Wind) -> Bool {
        return lhs.speed == rhs.speed &&
        lhs.degrees == rhs.degrees
    }
}
