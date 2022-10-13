//
//  WeatherViewModel.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

struct WeatherViewModel {
    let locationName: String
    let weahterConditionIconURL: URL?
    let temperature: String
    let weatherConditionDescription: String?
    let minimumTemperature: String
    let maximumTemperature: String
    let windDescription: String

    enum WeatherViewLocalization: Localizable {
        case minimumTemperature
        case maximumTemperature
        case windDescription
        case changeMessurementUnit
        case cancelActionSheet
    }
    
    init(model: WeatherModel) {
        self.locationName = model.forecast.locationName
        
        if let weatherCondition = model.forecast.currentWeatherCondition {
            self.weahterConditionIconURL = URL(string: "https://openweathermap.org/img/wn/\(weatherCondition.iconIdentifier)@2x.png")
        } else {
            self.weahterConditionIconURL = nil
        }
        
        let temperatureUnit = model.mesurementUnit.temperatureUnit
        
        self.temperature = "\(model.forecast.weather.temperature) \(temperatureUnit)"
        
        self.weatherConditionDescription = model.forecast.currentWeatherCondition?.description
        
        self.minimumTemperature = String(format: WeatherViewLocalization.minimumTemperature.localized,
                                         model.forecast.weather.minimumTemperature,
                                         temperatureUnit)
        
        self.maximumTemperature = String(format: WeatherViewLocalization.maximumTemperature.localized,
                                         model.forecast.weather.maximumTemperature,
                                         temperatureUnit)
        
        self.windDescription = String(format: WeatherViewLocalization.windDescription.localized,
                                      model.forecast.wind.speed,
                                      model.mesurementUnit.windSpeedUnit,
                                      model.forecast.wind.degrees)
    }
    
}
