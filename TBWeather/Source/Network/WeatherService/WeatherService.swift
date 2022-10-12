//
//  WeatherService.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation

final class WeatherService {
    
    private let client: RESTClientInterface
    
    init(client: RESTClientInterface = RESTClient()) {
        self.client = client
    }
}

extension WeatherService: WeatherServiceInterface {
    
    func getWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast {
        let endpoint = WeatherEndpoint(coordinate: coordinate, unit: unit)
        
        return try await client.request(type: WeatherForecast.self, endpoint: endpoint)
    }
    
}
