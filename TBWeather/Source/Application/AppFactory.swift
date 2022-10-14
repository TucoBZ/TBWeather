//
//  AppFactory.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import UIKit
import WeatherCore
import NetworkInterface
import Network

protocol AppFactoryProtocol: AnyObject {
    func makeWeather() -> UIViewController
    func makeMeasurementUnitSelection(completion: @escaping ((UIAlertAction) -> ())) -> UIViewController
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
        
        let worker = WeatherWorker(service: self.weatherService, userDefaults: .standard)
        
        let router = WeatherRouter(factory: self)
        
        let interactor = WeatherInteractor(presenter: presenter,
                                           worker: worker)
        
        router.source = viewController
        
        viewController.set(router: router, interactor: interactor)
        
        return viewController
    }
    
    func makeMeasurementUnitSelection(completion: @escaping ((UIAlertAction) -> ())) -> UIViewController {
        let actionSheetController = UIAlertController(title: WeatherViewModel.WeatherViewLocalization.changeMessurementUnit.localized,
                                                      message: nil,
                                                      preferredStyle: .actionSheet)
        
        MeasurementUnit.allCases.forEach {
            let action = UIAlertAction(title: $0.rawValue,
                                       style: .default,
                                       handler: completion)
            
            actionSheetController.addAction(action)
        }

        actionSheetController.addAction(UIAlertAction(title: WeatherViewModel.WeatherViewLocalization.cancelActionSheet.localized,
                                                      style: .cancel))
        return actionSheetController
    }
    
}
