//
//  WeatherInteractorTests.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import XCTest
import NetworkInterface
import WeatherCore
@testable import TBWeather

class WeatherInteractorTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchWeatherForecastSuccessAndPresentForecast() throws {
        // Given
        let expectation = expectation(description: "did call presenter present forecast")
        let presenterMock = WeatherPresenterMock()
        presenterMock.completion = {
            expectation.fulfill()
        }
        
        let workerMock = WeatherWorkerMock()
        let interactor = WeatherInteractor(presenter: presenterMock, worker: workerMock)
        
        // When
        interactor.fetchForecast()
        waitForExpectations(timeout: 2.0)
        
        // Then
        XCTAssertTrue(workerMock.didGetCurrentMeasurementUnit)
        XCTAssertTrue(workerMock.didFetchWeatherForecast)
        XCTAssertTrue(presenterMock.didPresentForecast)
    }
    
    func testFetchWeatherForecastFailureAndPresentEmptyState() throws {
        // Given
        let expectation = expectation(description: "did call presenter present forecast")
        let presenterMock = WeatherPresenterMock()
        presenterMock.completion = {
            expectation.fulfill()
        }
        
        let workerMock = WeatherWorkerMock()
        workerMock.serviceMock.shouldFailRequest = true
        let interactor = WeatherInteractor(presenter: presenterMock, worker: workerMock)
        
        // When
        interactor.fetchForecast()
        waitForExpectations(timeout: 2.0)
        
        // Then
        XCTAssertTrue(workerMock.didGetCurrentMeasurementUnit)
        XCTAssertTrue(workerMock.didFetchWeatherForecast)
        XCTAssertTrue(presenterMock.didPresentEmptyState)
    }
    
    func testUpdateMeasurementUnit() throws {
        // Given
        let presenterMock = WeatherPresenterMock()
        let workerMock = WeatherWorkerMock()
        let interactor = WeatherInteractor(presenter: presenterMock, worker: workerMock)
        
        // When
        interactor.updateMeasurementUnit(.imperial)
        
        // Then
        XCTAssertTrue(workerMock.didUpdateMeasurementUnit)
    }

}
