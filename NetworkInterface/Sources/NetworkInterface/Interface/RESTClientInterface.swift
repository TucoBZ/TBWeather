//
//  RESTClientInterface.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation

public protocol RESTClientInterface {
    func request<T: Decodable>(type: T.Type, endpoint: Endpoint) async throws -> T
}
