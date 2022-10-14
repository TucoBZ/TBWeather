//
//  WeahterViewControllerMock.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 14/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import NetworkInterface
import WeatherCore
@testable import TBWeather

final class WeatherViewControllerMock: WeatherViewControllerInput {
    var didUpdateView: Bool = false
    var didPresentEmptyState: Bool = false
    var updatedViewModel: WeatherViewModel?
    
    func updateView(viewModel: WeatherViewModel) {
        didUpdateView = true
        updatedViewModel = viewModel
    }
    
    func presentEmptyState() {
        didPresentEmptyState = true
    }
}
