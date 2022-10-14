//
//  WeatherForecast.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct WeatherForecast: Codable, Equatable {
    public let coordinate: Coordinate
    public let weatherConditions: [WeatherCondition]
    public let weather: Weather
    public let wind: Wind
    public let locationName: String
    public var currentWeatherCondition: WeatherCondition? { return weatherConditions.first }
    
    public init(coordinate: Coordinate,
                weatherConditions: [WeatherCondition],
                weather: Weather,
                wind: Wind,
                locationName: String) {
        self.coordinate = coordinate
        self.weatherConditions = weatherConditions
        self.weather = weather
        self.wind = wind
        self.locationName = locationName
    }
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherConditions = "weather"
        case weather = "main"
        case wind
        case locationName = "name"
    }
    
    public static func == (lhs: WeatherForecast, rhs: WeatherForecast) -> Bool {
        return lhs.coordinate == rhs.coordinate &&
        lhs.weatherConditions == rhs.weatherConditions &&
        lhs.weather == rhs.weather &&
        lhs.wind == rhs.wind &&
        lhs.locationName == rhs.locationName
    }
}
