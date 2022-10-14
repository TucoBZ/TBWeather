//
//  WeatherWorkerMock.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import NetworkInterface
import WeatherCore
@testable import TBWeather

final class WeatherWorkerMock: WeatherWorkerInput {
    var didGetCurrentMeasurementUnit: Bool = false
    var didUpdateMeasurementUnit: Bool = false
    var didFetchWeatherForecast: Bool = false
    var serviceMock: WeatherServiceMock = WeatherServiceMock()
    
    func updateMeasurementUnit(_ unit: MeasurementUnit) {
        didUpdateMeasurementUnit = true
    }
    
    func getCurrentMeasurementUnit() -> MeasurementUnit {
        didGetCurrentMeasurementUnit = true
        return .standard
    }
    
    func fetchWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast {
        didFetchWeatherForecast = true
        return try await serviceMock.getWeatherForecast(at: coordinate, unit: unit)
    }
    
}
