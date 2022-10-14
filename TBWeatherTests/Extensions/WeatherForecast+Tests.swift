//
//  WeatherForecast+Tests.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import WeatherCore

extension WeatherForecast {
    static func mock() -> WeatherForecast {
        return WeatherForecast(coordinate: Coordinate(longitude: 10, latitude: 10),
                               weatherConditions: [
                                WeatherCondition(identifier: 10,
                                                 group: .clear,
                                                 description: "some weather condition",
                                                 iconIdentifier: "01xd")
                               ],
                               weather: Weather(temperature: 10,
                                                minimumTemperature: 5,
                                                maximumTemperature: 15,
                                                feelsLikeTemperature: 10,
                                                pressure: 20,
                                                humidity: 30),
                               wind: Wind(speed: 10,
                                          degrees: 60),
                               locationName: "Brazil")
    }
}
