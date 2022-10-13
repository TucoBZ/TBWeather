//
//  Weather.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public struct Weather: Decodable {
    let temperature: Double
    let minimumTemperature: Double
    let maximumTemperature: Double
    let feelsLikeTemperature: Double
    let pressure: Double
    let humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case feelsLikeTemperature = "feels_like"
        case pressure
        case humidity
    }
}
