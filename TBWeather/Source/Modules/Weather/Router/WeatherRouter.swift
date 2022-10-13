//
//  WeatherRouter.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherRouterInput {
    func showMeasurementUnitSelection(completion: @escaping ((UIAlertAction) -> ()))
}

final class WeatherRouter: Router {

    weak var source: UIViewController?
    let factory: AppFactoryProtocol
    
    init(factory: AppFactoryProtocol) {
        self.factory = factory
    }
    
}

extension WeatherRouter: WeatherRouterInput {
    
    func showMeasurementUnitSelection(completion: @escaping ((UIAlertAction) -> ())) {
        let actionSheetController = factory.makeMeasurementUnitSelection(completion: completion)
        actionSheetController.popoverPresentationController?.barButtonItem = source?.navigationItem.rightBarButtonItem
        present(actionSheetController, animated: true)
    }
    
}
