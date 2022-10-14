//
//  Completionable.swift
//  TBWeatherTests
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation

protocol Completionable {
    typealias Completion = () -> ()
    var completion: Completion? { get set }
}
