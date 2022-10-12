//
//  ViewCodable.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation

protocol ViewCodable {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()
}

extension ViewCodable {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }
    
    func additionalSetup() {}
}
