//
//  WeatherPresenterTests.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 14/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import XCTest
import NetworkInterface
import WeatherCore
@testable import TBWeather

class WeatherPresenterTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentEmptyState() throws {
        // Given
        let controllerMock = WeatherViewControllerMock()
        let presenter = WeatherPresenter(viewController: controllerMock)

        // When
        presenter.presentEmptyState()
        
        // Then
        XCTAssertTrue(controllerMock.didPresentEmptyState)
    }
    
    func testPresentForecast() throws {
        // Given
        let controllerMock = WeatherViewControllerMock()
        let weatherModelMock = WeatherModel.mock()
        let presenter = WeatherPresenter(viewController: controllerMock)

        // When
        presenter.presentForecast(with: weatherModelMock)
        
        // Then
        XCTAssertTrue(controllerMock.didUpdateView)
        let updatedViewModel = try XCTUnwrap(controllerMock.updatedViewModel)
        try validate(inputModel: weatherModelMock, output: updatedViewModel)
    }
    
    private func validate(inputModel: WeatherModel, output: WeatherViewModel) throws {
        XCTAssertTrue(output.locationName == inputModel.forecast.locationName)
        
        let currentWeatherCondition = try XCTUnwrap(inputModel.forecast.currentWeatherCondition)
        let weahterConditionIconURL = try XCTUnwrap(output.weahterConditionIconURL)
        XCTAssertTrue(weahterConditionIconURL.absoluteString.contains(currentWeatherCondition.iconIdentifier))
        
        XCTAssertTrue(output.temperature == "\(inputModel.forecast.weather.temperature) \(inputModel.mesurementUnit.temperatureUnit)")
        
        XCTAssertTrue(output.weatherConditionDescription == currentWeatherCondition.description)
        
        XCTAssertTrue(output.minimumTemperature == String(format: WeatherViewModel.WeatherViewLocalization.minimumTemperature.localized,
                                                          inputModel.forecast.weather.minimumTemperature,
                                                          inputModel.mesurementUnit.temperatureUnit))
        
        XCTAssertTrue(output.maximumTemperature == String(format: WeatherViewModel.WeatherViewLocalization.maximumTemperature.localized,
                                                          inputModel.forecast.weather.maximumTemperature,
                                                          inputModel.mesurementUnit.temperatureUnit))
        
        XCTAssertTrue(output.windDescription == String(format: WeatherViewModel.WeatherViewLocalization.windDescription.localized,
                                                       inputModel.forecast.wind.speed,
                                                       inputModel.mesurementUnit.windSpeedUnit,
                                                       inputModel.forecast.wind.degrees))
    }
}
