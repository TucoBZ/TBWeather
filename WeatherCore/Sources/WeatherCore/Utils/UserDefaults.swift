//
//  UserDefaults.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<Value: Codable> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults
    public var wrappedValue: Value {
        
        get {
            guard let base64 = container.object(forKey: key) as? String,
                  let data = Data(base64Encoded: base64),
                  let value = try? JSONDecoder().decode(Value.self, from: data) else {
                return defaultValue
            }
            return value
        }
        
        set {
            guard let data = try? JSONEncoder().encode(newValue) else { return }
            let base64 = data.base64EncodedString()
            container.set(base64, forKey: key)
        }
        
    }
    
    public init(key: String, defaultValue: Value, container: UserDefaults) {
        self.key = key
        self.defaultValue = defaultValue
        self.container = container
    }
}
