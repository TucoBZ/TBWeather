//
//  MeasurmentUnit.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public enum MeasurementUnit: String, CaseIterable, Codable, Localizable {
    case standard
    case metric
    case imperial
    
    var temperatureUnit: String {
        switch self {
        case .standard: return "K"
        case .metric: return "ºC"
        case .imperial: return "ºF"
        }
    }
    
    var windSpeedUnit: String {
        switch self {
        case .standard, .metric: return "m/s"
        case .imperial: return "mph"
        }
    }
}
