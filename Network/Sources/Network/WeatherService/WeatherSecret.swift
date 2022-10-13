//
//  WeatherSecret.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation

struct WheaterAPI: Decodable {
    let secret: String
    
    private enum CodingKeys: String, CodingKey {
        case secret = "WEATHER_API_KEY"
    }
    
    static func build() -> WheaterAPI? {
        guard let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
              let data = try? Data(contentsOf: url) else { return nil }
        
        let decoder = PropertyListDecoder()
        return try? decoder.decode(WheaterAPI.self, from: data)
    }
}
