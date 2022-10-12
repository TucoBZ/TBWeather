//
//  WeatherService.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation

protocol WeatherServiceInterface {
    func getWeatherForecast(at coordinate: Coordinate, unit: MeasurementUnit?) async throws -> WeatherForecast
}

struct WeatherEndpoint: Endpoint {
    var hostUrl: String = "https://api.openweathermap.org"
    var path: String = "/data/2.5/weather"
    var method: HTTPMethod = .get
    var headers: Headers?
    var parameters: Parameters?
    var body: BodyData?
    
    init(coordinate: Coordinate, unit: MeasurementUnit?) {
        parameters = [
            "appid": "",
            "lat": "\(coordinate.latitude)",
            "lon": "\(coordinate.longitude)"
        ]
        
        if let unit = unit {
            parameters?["units"] = unit.rawValue
        }
    }
}

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
