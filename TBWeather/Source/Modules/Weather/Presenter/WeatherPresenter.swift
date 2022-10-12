//
//  WeatherPresenter.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherPresenterInput {
    func presentForecast(with model: WeatherModel)
    func presentEmptyState()
}

final class WeatherPresenter {

    private weak var viewController: WeatherViewControllerInput?

    init(viewController: WeatherViewControllerInput) {
        self.viewController = viewController
    }
}

extension WeatherPresenter: WeatherPresenterInput {

    func presentForecast(with model: WeatherModel) {
        let viewModel = WeatherViewModel(model: model)
        viewController?.updateView(viewModel: viewModel)
    }
    
    func presentEmptyState() {
        
    }
}
