//
//  RESTClient.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation

public final class RESTClient: RESTClientInterface {
    
    public func request<T>(type: T.Type, endpoint: Endpoint) async throws -> T where T : Decodable {
        let urlBuilder = URLRequestBuilder()
        urlBuilder.setEndpoint(endpoint)
        
        let urlRequest = try urlBuilder.build()
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try JSONDecoder().decode(T.self, from: data)
    }

}
