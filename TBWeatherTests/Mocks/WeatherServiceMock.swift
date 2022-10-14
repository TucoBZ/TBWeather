//
//  WeatherServiceMock.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import NetworkInterface
import WeatherCore

final class WeatherServiceMock: WeatherServiceInterface {
    var shouldFailRequest: Bool = false
    var response: WeatherForecast = .mock()
    
    func getWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast {
        if shouldFailRequest {
            throw NSError.init(domain: String(describing: WeatherServiceMock.self), code: URLError.Code.badURL.rawValue)
        }
        
        return response
    }
}
