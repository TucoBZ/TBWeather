//
//  WeatherView.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol WeatherViewDelegate: AnyObject {
    // func didTap()
}

final class WeatherView: UIView {

    var viewModel: WeatherViewModel?
    weak var delegate: WeatherViewDelegate?

    private var helloWorldLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        helloWorldLabel.text = viewModel.locationName
    }

    func setupView() {

        // Setup Hierarchy
        self.addSubview(helloWorldLabel)

        // Setup Constraints
        helloWorldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            helloWorldLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            helloWorldLabel.heightAnchor.constraint(equalToConstant: 44),
            helloWorldLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            helloWorldLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

        // Render
        self.backgroundColor = .white
        helloWorldLabel.text = viewModel?.locationName ?? "Loading..."
    }
}
