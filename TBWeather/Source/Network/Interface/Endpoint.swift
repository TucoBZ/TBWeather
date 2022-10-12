//
//  Endpoint.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//

public protocol Endpoint {
    typealias Headers = [String: String]
    typealias Parameters = [String: String]
    typealias BodyData = [String: String]
    
    var hostUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: Headers? { get }
    var parameters: Parameters? { get }
    var body: BodyData? { get }
}

public enum HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}
