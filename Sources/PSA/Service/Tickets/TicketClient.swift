import Foundation
import Alamofire

class TicketClient {
    var request: URLRequest
    
    var tickets: [Ticket] {
        get async throws {
            let response = await AF.request("https://httpbin.org/get", interceptor: .retryPolicy)
//            AF.request(<#T##convertible: any URLConvertible##any URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##(Encodable & Sendable)?#>, encoder: <#T##any ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##(any RequestInterceptor)?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
            let data = try await downloader.httpData(from: feedURL)
            let allQuakes = try decoder.decode(GeoJSON.self, from: data)
            return allQuakes.quakes
        }
    }

    init(url: String, headers: [String: String]) {
        self.request = URLRequest(url: URL(string: url)!)
    }
    
    
    
}
