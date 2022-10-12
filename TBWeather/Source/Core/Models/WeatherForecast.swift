//
//  WeatherForecast.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

struct WeatherForecast: Decodable {
    let coordinate: Coordinate
    let weatherConditions: [WeatherCondition]
    let weather: Weather
    let wind: Wind
    
    var currentWeatherCondition: WeatherCondition? { return weatherConditions.first }
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherConditions = "weather"
        case weather = "main"
        case wind
    }
}
