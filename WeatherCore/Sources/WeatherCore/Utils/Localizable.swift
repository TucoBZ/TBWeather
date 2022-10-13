//
//  Localizable.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation

public protocol Localizable {
    var localized: String { get }
    var tableName: String { get }
    var bundle: Bundle { get }
}

public extension Localizable {
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
