import XCTest
import NetworkInterface
@testable import Network

final class NetworkTests: XCTestCase {
    
    struct MockEndpoint: Endpoint {
        var hostUrl: String = "http://sample.com"
        var path: String = "/path/to/some/api/"
        var method: HTTPMethod = .get
        var headers: Headers? = ["header1": "header-value1", "header2": "header-value2"]
        var parameters: Parameters? = ["parameter1": "parameter-value1", "parameter2": "parameter-value2"]
        var body: BodyData? = ["body1": "body-value1", "body2": "body-value2"]
    }
    
    func testURLRequestBuilder() throws {
        let endpoint = MockEndpoint()
        let builder = URLRequestBuilder()
        builder.setEndpoint(endpoint)
        
        let urlRequest = try builder.build()
        
        XCTAssertTrue(urlRequest.httpMethod == endpoint.method.rawValue)
    }
}
