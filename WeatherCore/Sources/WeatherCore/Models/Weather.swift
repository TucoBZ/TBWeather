//
//  Weather.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Weather: Codable, Equatable {
    public let temperature: Double
    public let minimumTemperature: Double
    public let maximumTemperature: Double
    public let feelsLikeTemperature: Double
    public let pressure: Double
    public let humidity: Double
    
    public init(temperature: Double,
                  minimumTemperature: Double,
                  maximumTemperature: Double,
                  feelsLikeTemperature: Double,
                  pressure: Double,
                  humidity: Double) {
        self.temperature = temperature
        self.minimumTemperature = minimumTemperature
        self.maximumTemperature = maximumTemperature
        self.feelsLikeTemperature = feelsLikeTemperature
        self.pressure = pressure
        self.humidity = humidity
    }
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case feelsLikeTemperature = "feels_like"
        case pressure
        case humidity
    }
    
    public static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.temperature == rhs.temperature &&
        lhs.minimumTemperature == rhs.minimumTemperature &&
        lhs.maximumTemperature == rhs.maximumTemperature &&
        lhs.feelsLikeTemperature == rhs.feelsLikeTemperature &&
        lhs.pressure == rhs.pressure &&
        lhs.humidity == rhs.humidity
    }
}
