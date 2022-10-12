//
//  WeatherEndpoint.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

struct WeatherEndpoint: Endpoint {
    var hostUrl: String = "https://api.openweathermap.org"
    var path: String = "/data/2.5/weather"
    var method: HTTPMethod = .get
    var headers: Headers?
    var parameters: Parameters?
    var body: BodyData?
    
    init(coordinate: Coordinate, unit: MeasurementUnit?) {
        guard let api = WheaterAPI.build() else {
            fatalError("You do not have Secret.plist file set")
        }
        
        parameters = [
            "appid": api.secret,
            "lat": "\(coordinate.latitude)",
            "lon": "\(coordinate.longitude)"
        ]
        
        if let unit = unit {
            parameters?["units"] = unit.rawValue
        }
    }

}
