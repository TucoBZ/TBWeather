//
//  Endpoint+Extensions.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation

extension Endpoint {
    var queryItems: [URLQueryItem]? {
        return parameters?.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    var url: URL? {
        return URL(string: "\(hostUrl)\(path)")
    }
}

