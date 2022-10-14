//
//  WeatherWorkerTests.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import XCTest
import NetworkInterface
import WeatherCore
@testable import TBWeather

class WeatherWorkerTests: XCTestCase {

    var userDefaults: UserDefaults!
    
    override func setUpWithError() throws {
        userDefaults = UserDefaults(suiteName: String(reflecting: self))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        userDefaults.removePersistentDomain(forName: String(reflecting: self))
        userDefaults = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchWeatherForecastSuccess() async throws {
        // Given
        let serviceMock = WeatherServiceMock()
        let worker = WeatherWorker(service: serviceMock, userDefaults: userDefaults)
        
        // When
        let response = try await worker.fetchWeatherForecast(at: Coordinate(longitude: 10, latitude: 10), unit: .standard)
        
        // Then
        XCTAssertTrue(serviceMock.response == response)
    }
    
    func testFetchWeatherForecastFailure() async throws {
        // Given
        let serviceMock = WeatherServiceMock()
        serviceMock.shouldFailRequest = true
        let worker = WeatherWorker(service: serviceMock, userDefaults: userDefaults)
        
        // When
        let response = try? await worker.fetchWeatherForecast(at: Coordinate(longitude: 10, latitude: 10), unit: .standard)
        
        // Then
        XCTAssertNil(response)
    }
    
    func testInitialMeasurementUnitIsStandard() throws {
        // Given
        let serviceMock = WeatherServiceMock()
        let worker = WeatherWorker(service: serviceMock, userDefaults: userDefaults)
        
        let unit = worker.getCurrentMeasurementUnit()
        
        XCTAssertTrue(unit == .standard)
    }
    
    func testMeasurementUnitCanUpdate() throws {
        // Given
        let serviceMock = WeatherServiceMock()
        let worker = WeatherWorker(service: serviceMock, userDefaults: userDefaults)
        
        let initialUnit = worker.getCurrentMeasurementUnit()
        worker.updateMeasurementUnit(.metric)
        let newUnit = worker.getCurrentMeasurementUnit()
        
        XCTAssertTrue(initialUnit != newUnit)
        XCTAssertTrue(newUnit == .metric)
    }

}
