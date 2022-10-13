//
//  ServiceWeatherInterface.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation
import WeatherCore

public protocol WeatherServiceInterface {
    func getWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast
}
