//
//  Weather.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Weather: Decodable {
    public let temperature: Double
    public let minimumTemperature: Double
    public let maximumTemperature: Double
    public let feelsLikeTemperature: Double
    public let pressure: Double
    public let humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case feelsLikeTemperature = "feels_like"
        case pressure
        case humidity
    }
}
