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
    func presentEmptyState()
}

final class WeatherViewController: BaseViewController {

    private var viewModel: WeatherViewModel?
    private var router: WeatherRouterInput?
    private var interactor: WeatherInteractorInput?
    private var moduleView: ForecastView?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addChangeUnitButton()
        loadContent()
    }

    override func loadView() {
        setupView()
    }

    private func loadContent() {
        showLoading()
        hideEmptyState()
        moduleView?.hideContent()
        interactor?.fetchForecast()
    }

    // MARK: Setup

    func set(router: WeatherRouterInput,
             interactor: WeatherInteractorInput) {
        self.router = router
        self.interactor = interactor
    }

    private func setupView() {
        moduleView = ForecastView()
        self.view = moduleView
    }
    
    override func didTryAgain() {
        loadContent()
    }
        
}

// MARK: Measurement Unit Configuration

extension WeatherViewController {
    private func addChangeUnitButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "thermometer.sun"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(showMeasurementUnitSelection))
    }
    
    @objc
    private func showMeasurementUnitSelection() {
        router?.showMeasurementUnitSelection(completion: handleActionSelection(action:))
    }
    
    private func handleActionSelection(action: UIAlertAction) {
        guard let actionTitle = action.title , let unit = MeasurementUnit(rawValue: actionTitle) else { return }
        interactor?.updateMeasurementUnit(unit)
        loadContent()
    }
}

extension WeatherViewController: WeatherViewControllerInput {
    
    func updateView(viewModel: WeatherViewModel) {
        self.hideLoading()
        self.viewModel = viewModel
        self.moduleView?.updateView(with: viewModel)
    }
    
    func presentEmptyState() {
        self.hideLoading()
        moduleView?.hideContent()
        showEmptyState()
    }
    
}
