//
//  RESTClientMock.swift
//  
//
//  Created by Túlio Bazan da Silva on 13/10/22.
//

import Foundation
import NetworkInterface

final class RESTClientMock: RESTClientInterface {
    
    var shouldFailRequest: Bool = false
    var serializedResponse: Data?
    
    func request<T>(type: T.Type, endpoint: Endpoint) async throws -> T where T : Decodable {
        if shouldFailRequest || serializedResponse == nil {
            throw NSError.init(domain: String(describing: RESTClientMock.self), code: URLError.Code.badURL.rawValue)
        }
        
        return try JSONDecoder().decode(T.self, from: serializedResponse!)
    }
    
}
