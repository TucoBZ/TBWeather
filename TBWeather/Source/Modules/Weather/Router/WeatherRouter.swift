//
//  WeatherRouter.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherRouterInput {}

final class WeatherRouter: Router {

    weak var source: UIViewController?
    let factory: AppFactoryProtocol
    
    init(factory: AppFactoryProtocol) {
        self.factory = factory
    }
    
}

extension WeatherRouter: WeatherRouterInput {}
