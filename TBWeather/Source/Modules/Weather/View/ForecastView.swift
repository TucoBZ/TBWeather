//
//  ForecastView.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

final class ForecastView: UIView {
    
    private lazy var topSpacer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomSpacer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 24.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var subContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var forecastImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherConditionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var minimumTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maximumTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with viewModel: WeatherViewModel) {
        locationLabel.text = viewModel.locationName
        forecastImage.sd_setImage(with: viewModel.weahterConditionIconURL)
        temperatureLabel.text = viewModel.temperature
        weatherConditionDescriptionLabel.text = viewModel.weatherConditionDescription
        minimumTemperatureLabel.text = viewModel.minimumTemperature
        maximumTemperatureLabel.text = viewModel.maximumTemperature
        windLabel.text = viewModel.windDescription
    }

}

extension ForecastView: ViewCodable {
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(topSpacer)
        
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(forecastImage)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherConditionDescriptionLabel)
        stackView.addArrangedSubview(subContentStackView)
        
        subContentStackView.addArrangedSubview(temperatureStackView)
        temperatureStackView.addArrangedSubview(minimumTemperatureLabel)
        temperatureStackView.addArrangedSubview(maximumTemperatureLabel)
        subContentStackView.addArrangedSubview(windLabel)
        
        stackView.addArrangedSubview(bottomSpacer)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            forecastImage.heightAnchor.constraint(equalToConstant: 120),
            
            topSpacer.heightAnchor.constraint(equalTo: bottomSpacer.heightAnchor)
        ])
    }
    
    func additionalSetup() {
        backgroundColor = .systemBackground
    }
}
