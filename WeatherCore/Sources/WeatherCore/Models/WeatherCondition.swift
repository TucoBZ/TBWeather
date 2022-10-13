//
//  WeatherCondition.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct WeatherCondition: Decodable {
    public let identifier: Double
    public let group: WeatherGroup
    public let description: String
    public let iconIdentifier: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case group = "main"
        case description
        case iconIdentifier = "icon"
    }
    
    public enum WeatherGroup: String, Decodable {
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
}
