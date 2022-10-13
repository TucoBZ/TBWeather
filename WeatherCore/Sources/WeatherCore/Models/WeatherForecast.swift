//
//  WeatherForecast.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct WeatherForecast: Decodable {
    public let coordinate: Coordinate
    public let weatherConditions: [WeatherCondition]
    public let weather: Weather
    public let wind: Wind
    public let locationName: String
    
    public var currentWeatherCondition: WeatherCondition? { return weatherConditions.first }
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherConditions = "weather"
        case weather = "main"
        case wind
        case locationName = "name"
    }
}
