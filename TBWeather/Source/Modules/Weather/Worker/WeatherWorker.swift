//
//  WeatherWorker.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit
import WeatherCore
import NetworkInterface

protocol WeatherWorkerInput {
    func updateMeasurementUnit(_ unit: MeasurementUnit)
    func getCurrentMeasurementUnit() -> MeasurementUnit
    func fetchWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast
}

final class WeatherWorker {
    
    private let service: WeatherServiceInterface
    private static var userDefaults: UserDefaults?
    
    @UserDefault(key: "currentMessureUnit", defaultValue: .standard, container: userDefaults ?? .standard )
    var currentMeasurementUnit: MeasurementUnit
    
    init(service: WeatherServiceInterface, userDefaults: UserDefaults) {
        self.service = service
        WeatherWorker.userDefaults = userDefaults
    }
}

extension WeatherWorker: WeatherWorkerInput {
    func updateMeasurementUnit(_ unit: MeasurementUnit) {
        self.currentMeasurementUnit = unit
    }
    
    func getCurrentMeasurementUnit() -> MeasurementUnit {
        return currentMeasurementUnit
    }
    
    func fetchWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast {
        return try await service.getWeatherForecast(at: coordinate, unit: unit)
    }
}

