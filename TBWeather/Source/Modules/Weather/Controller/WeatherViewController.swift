//
//  WeatherViewController.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherViewControllerInput: AnyObject {
    func updateView(viewModel: WeatherViewModel)
}

final class WeatherViewController: UIViewController {

    private var viewModel: WeatherViewModel?
    private var router: WeatherRouterInput?
    private var interactor: WeatherInteractorInput?
    private var moduleView: WeatherView?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "VIP"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        loadContent()
    }

    override func loadView() {
        setupView()
    }

    private func loadContent() {
        interactor?.fetchForecast()
    }

    // MARK: Setup

    func set(router: WeatherRouterInput,
             interactor: WeatherInteractorInput) {
        self.router = router
        self.interactor = interactor
    }

    private func setupView() {
        moduleView = WeatherView()
        moduleView?.delegate = self
        self.view = moduleView
    }
}

extension WeatherViewController: WeatherViewControllerInput {
    
    func updateView(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        self.moduleView?.updateView(with: viewModel)
    }
}

extension WeatherViewController: WeatherViewDelegate {}
