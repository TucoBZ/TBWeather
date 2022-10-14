//
//  WeatherEndpoint.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import WeatherCore
import NetworkInterface

struct WeatherEndpoint: Endpoint {
    var hostUrl: String = "https://api.openweathermap.org"
    var path: String = "/data/2.5/weather"
    var method: HTTPMethod = .get
    var headers: Headers?
    var parameters: Parameters?
    var body: BodyData?
    
    init(coordinate: Coordinate, unit: MeasurementUnit?, apiSecret: String?) {
        guard let apiSecret = apiSecret else {
            fatalError("You do not have Secret set")
        }
        
        parameters = [
            "appid": apiSecret,
            "lat": "\(coordinate.latitude)",
            "lon": "\(coordinate.longitude)"
        ]
        
        if let unit = unit {
            parameters?["units"] = unit.rawValue
        }
    }

}
