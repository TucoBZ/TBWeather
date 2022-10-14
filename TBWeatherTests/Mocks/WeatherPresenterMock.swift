//
//  WeatherPresenterMock.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import NetworkInterface
import WeatherCore
@testable import TBWeather

final class WeatherPresenterMock: WeatherPresenterInput, Completionable {
    var completion: Completion?
    var didPresentForecast: Bool = false
    var didPresentEmptyState: Bool = false
    
    func presentForecast(with model: WeatherModel) {
        didPresentForecast = true
        completion?()
    }
    
    func presentEmptyState() {
        didPresentEmptyState = true
        completion?()
    }
}
