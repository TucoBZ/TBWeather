//
//  ViewController.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .blue
        
        let service = WeatherService()
        
        Task {
            let forecast = try? await service.getWeatherForecast(at: Coordinate(longitude: -118.491227, latitude: 34.0194704), unit: .metric)
            print(forecast)
            print(forecast?.currentWeatherCondition)
        }
        
    }


}

