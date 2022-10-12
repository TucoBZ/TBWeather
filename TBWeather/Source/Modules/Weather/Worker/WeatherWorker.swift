//
//  WeatherWorker.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherWorkerInput {
    func fetchWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast
}

final class WeatherWorker {
    
    let service: WeatherServiceInterface
    
    init(service: WeatherServiceInterface) {
        self.service = service
    }
    
}

extension WeatherWorker: WeatherWorkerInput {
    
    func fetchWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast {
        return try await service.getWeatherForecast(at: coordinate, unit: unit)
    }
    
    

}

