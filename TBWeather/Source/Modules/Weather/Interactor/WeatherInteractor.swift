//
//  WeatherInteractor.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherInteractorInput {
    func fetchForecast()
}

final class WeatherInteractor {

    private var presenter: WeatherPresenterInput
    private var worker: WeatherWorkerInput

    init(presenter: WeatherPresenterInput,
         worker: WeatherWorkerInput) {
        self.presenter = presenter
        self.worker = worker
    }
    
    private func getCurrentCoordinate() -> Coordinate {
        return Coordinate(longitude: -118.491227, latitude: 34.0194704)
    }
    
    private func getCurrentMeasurementUnit() -> MeasurementUnit {
        return .metric
    }
}

extension WeatherInteractor: WeatherInteractorInput {

    func fetchForecast() {
        Task {
            do {
                let coordinate = getCurrentCoordinate()
                let unit = getCurrentMeasurementUnit()
                let forecast = try await worker.fetchWeatherForecast(at: coordinate, unit: unit)
                
                await MainActor.run { handle(forecast: forecast, unit: unit) }
            } catch let error {
                await MainActor.run { handle(error: error) }
            }
        }
    }
}

private extension WeatherInteractor {

    func handle(forecast: WeatherForecast, unit: MeasurementUnit) {
        let model = WeatherModel(forecast: forecast, mesurementUnit: unit)
        presenter.presentForecast(with: model)
    }
    
    func handle(error: Error) {
        
    }
}
