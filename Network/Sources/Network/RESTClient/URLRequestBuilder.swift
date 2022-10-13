//
//  URLRequestBuilder.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

import Foundation
import NetworkInterface

final class URLRequestBuilder {
    
    public private(set) var endpoint: Endpoint?
    
    func setEndpoint(_ endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func build() throws -> URLRequest {
        guard let url = setupUrlQueryParameters() else {
            throw NSError.init(domain: String(describing: URLRequestBuilder.self), code: URLError.Code.badURL.rawValue)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint?.method.rawValue
        
        if let body = endpoint?.body {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body as Any)
        }
        
        if let headers = endpoint?.headers {
            for header in headers {
                urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        return urlRequest
    }
    
    private func setupUrlQueryParameters() -> URL? {
        guard let url = endpoint?.url,
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        
        if let queryItems = endpoint?.queryItems {
            components.queryItems = queryItems
        }
        
        return components.url
    }
}
