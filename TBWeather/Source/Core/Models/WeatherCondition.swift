//
//  WeatherCondition.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

struct WeatherCondition: Decodable {
    let identifier: Double
    let group: WeatherGroup
    let description: String
    let iconIdentifier: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case group = "main"
        case description
        case iconIdentifier = "icon"
    }
    
    enum WeatherGroup: String, Decodable {
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
