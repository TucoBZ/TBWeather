//
//  WeatherModel+Tests.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 14/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import WeatherCore
@testable import TBWeather

extension WeatherModel {
    static func mock() -> WeatherModel {
        return WeatherModel(forecast: .mock(), mesurementUnit: .standard)
    }
}
