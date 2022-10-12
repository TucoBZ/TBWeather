//
//  Localizable.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation

protocol Localizable {
    var localized: String { get }
    var tableName: String { get }
    var bundle: Bundle { get }
}

extension Localizable {
    var localized: String {
        return NSLocalizedString(String(reflecting: self),
                                 tableName: tableName,
                                 bundle: bundle,
                                 value: "",
                                 comment: "")
    }
    
    var tableName: String { return "Localizable" }
    
    var bundle: Bundle { return Bundle.main }
}
