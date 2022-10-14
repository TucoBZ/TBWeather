import XCTest
import NetworkInterface
import WeatherCore
@testable import Network

final class NetworkTests: XCTestCase {
    
    func testURLRequestBuilder() throws {
        // Given
        let endpoint = MockEndpoint()
        let builder = URLRequestBuilder()
        builder.setEndpoint(endpoint)
        
        // When
        let urlRequest = try builder.build()
        
        // Then
        XCTAssertTrue(endpoint.method.rawValue == urlRequest.httpMethod)
        XCTAssertTrue(endpoint.hostUrl.contains(urlRequest.url!.host!))
        XCTAssertTrue(endpoint.path == urlRequest.url?.path)
        XCTAssertTrue(endpoint.headers == urlRequest.allHTTPHeaderFields)
        
        var query = endpoint.parameters!.reduce("") { (result, next) in
            return result + "\(next.key)=\(next.value)&"
        }
        query.removeLast()
        XCTAssertTrue(query == urlRequest.url?.query)
        
        let bodyData = try JSONSerialization.data(withJSONObject: endpoint.body! as Any)
        XCTAssertTrue(bodyData == urlRequest.httpBody!)
    }
    
    func testWeatherServiceSuccessRequest() async throws {
        // Given
        let forecast = mockWeatherForecast()
        let clientMock = RESTClientMock()
        clientMock.serializedResponse = try JSONEncoder().encode(forecast)
        
        let secret = WheaterAPI(secret: "TEST")
        let service = WeatherService(client: clientMock)
        service.apiConfig = secret
        
        // When
        let response = try await service.getWeatherForecast(at: Coordinate(longitude: 10, latitude: 10), unit: .standard)
        
        // Then
        XCTAssertTrue(forecast == response)
    }
    
    func testWeatherServiceFaillureRequest() async throws {
        // Given
        let clientMock = RESTClientMock()
        clientMock.shouldFailRequest = true
        
        let secret = WheaterAPI(secret: "TEST")
        let service = WeatherService(client: clientMock)
        service.apiConfig = secret
        
        // When
        let response = try? await service.getWeatherForecast(at: Coordinate(longitude: 10, latitude: 10), unit: .standard)
        
        // Then
        XCTAssertNil(response)
    }
}

extension NetworkTests {
    func mockWeatherForecast() -> WeatherForecast {
        return WeatherForecast(coordinate: Coordinate(longitude: 10, latitude: 10),
                               weatherConditions: [
                                WeatherCondition(identifier: 10,
                                                 group: .clear,
                                                 description: "some weather condition",
                                                 iconIdentifier: "01xd")
                               ],
                               weather: Weather(temperature: 10,
                                                minimumTemperature: 5,
                                                maximumTemperature: 15,
                                                feelsLikeTemperature: 10,
                                                pressure: 20,
                                                humidity: 30),
                               wind: Wind(speed: 10,
                                          degrees: 60),
                               locationName: "Brazil")
    }
}
