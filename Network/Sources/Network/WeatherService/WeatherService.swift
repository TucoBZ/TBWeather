//
//  WeatherService.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation
import WeatherCore
import NetworkInterface

public final class WeatherService {
    
    private let client: RESTClientInterface
    
    public init(client: RESTClientInterface = RESTClient()) {
        self.client = client
    }
}

extension WeatherService: WeatherServiceInterface {
    
    public func getWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast {
        let endpoint = WeatherEndpoint(coordinate: coordinate, unit: unit)
        
        return try await client.request(type: WeatherForecast.self, endpoint: endpoint)
    }
    
}
