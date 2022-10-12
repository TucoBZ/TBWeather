//
//  AppFactory.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import UIKit

protocol AppFactoryProtocol: AnyObject {
    func makeWeather() -> UIViewController
}

final class AppFactory {
    let weatherService: WeatherServiceInterface
    
    init(weatherService: WeatherServiceInterface = WeatherService()) {
        self.weatherService = weatherService
    }
    
}

extension AppFactory: AppFactoryProtocol {
    
    func makeWeather() -> UIViewController {
        let viewController  = WeatherViewController()
        
        let presenter = WeatherPresenter(viewController: viewController)
        
        let worker = WeatherWorker(service: self.weatherService)
        
        let router = WeatherRouter(factory: self)
        
        let interactor = WeatherInteractor(presenter: presenter,
                                           worker: worker)
        
        router.source = viewController
        
        viewController.set(router: router, interactor: interactor)
        
        return viewController
    }
    
    
}
