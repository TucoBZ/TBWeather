//
//  WeatherCondition.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct WeatherCondition: Codable, Equatable {
    public let identifier: Double
    public let group: WeatherGroup
    public let description: String
    public let iconIdentifier: String
    
    public init(identifier: Double, group: WeatherCondition.WeatherGroup, description: String, iconIdentifier: String) {
        self.identifier = identifier
        self.group = group
        self.description = description
        self.iconIdentifier = iconIdentifier
    }
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case group = "main"
        case description
        case iconIdentifier = "icon"
    }
    
    public enum WeatherGroup: String, Codable {
        case thunderstorm = "Thunderstorm"
        case drizzle = "Drizzle"
        case rain = "Rain"
        case snow = "Snow"
        case mist = "Mist"
        case smoke = "Smoke"
        case haze = "Haze"
        case dust = "Dust"
        case fog = "Fog"
        case sand = "Sand"
        case ash = "Ash"
        case squall = "Squall"
        case tornado = "Tornado"
        case clear = "Clear"
        case clouds = "Clouds"
    }
    
    public static func == (lhs: WeatherCondition, rhs: WeatherCondition) -> Bool {
        return lhs.identifier == rhs.identifier &&
        lhs.group == rhs.group &&
        lhs.description == rhs.description &&
        lhs.iconIdentifier == rhs.iconIdentifier
    }
}
