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

    init(model: WeatherModel) {
        self.locationName = model.forecast.locationName
        
        if let weatherCondition = model.forecast.currentWeatherCondition {
            self.weahterConditionIconURL = URL(string: "http://openweathermap.org/img/wn/\(weatherCondition.iconIdentifier)@2x.png")
        } else {
            self.weahterConditionIconURL = nil
        }
    }
    
}
