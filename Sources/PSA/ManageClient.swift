import Foundation

final class ManageClient: Sendable {
    private let manageURL: URLComponents
    private let username: String
    private let password: String
    private let clientId: String
    private let version: Version
    private let release: Release
    private let _service: ServiceClient
    let _headers: HTTPHeaders

    /// Supabase Auth allows you to create and manage user sessions for access to data that is secured by access policies.
    var service: ServiceClient {
        return _service
    }

    init(
        companyId: String,
        companyUrl: String,
        publicKey: String,
        privateKey: String,
        clientId: String,
        entryPoint: Release = .v4_6,
        apiVersion: Version = .v3,
        timeout: Int = 20000,
        retry: Bool = false,
        retryOptions: RetryOptions = .init(
            retries: 4,
            minTimeout: 50,
            maxTimeout: 20000,
            randomize: true
        ),
        debug: Bool = false
    ) {
        var url: URLComponents = URLComponents()
        url.scheme = "https"
        url.host = companyUrl
        url.path = "/\(release.releaseString)/apis/\(version.versionString)"

        _headers = HTTPHeaders([
            "Authorization":
                "Basic \(String(companyId + "+" + username + ":" + password).toBase64())",
            "clientId": clientId,
        ])

        guard let url = url.url else { fatalError() }
        self._service = ServiceClient(
            url: url.appendingPathComponent("/service"),
            headers: _headers.dictionary
        )

    }

    enum Release: String {
        case v4_6

        var releaseString: String {
            switch self {
            case .v4_6: return "v4_6_release"
            }
        }
    }

    enum Version: String {
        case v1, v2, v3

        var versionString: String {
            switch self {
            case .v1: return "1.0"
            case .v2: return "2.0"
            case .v3: return "3.0"
            }
        }
    }

    enum Module: Codable {
        case documents(DocumentPath)
        case finance(FinancePath)
        case project(ProjectPath)
        case sales(SalesPath)
        case service(ServicePath)
        case system(SystemPath)

        var modulePath: String {
            switch self {
            case .documents(let documentPath):
                "/documents/\(documentPath.rawValue)"
            case .finance(let financePath):
                "/finance/\(financePath.rawValue)"
            case .project(let projectPath):
                "/project/\(projectPath.rawValue)"
            case .sales(let salesPath):
                "/sales/\(salesPath.rawValue)"
            case .service(let servicePath):
                "/service/\(servicePath.path)"
            case .system(let systemPath):
                "/system/\(systemPath.rawValue)"
            }
        }

        enum DocumentPath: String, Codable {
            case documents
        }

        enum FinancePath: String, Codable {
            case documents
        }

        enum ProjectPath: String, Codable {
            case documents
        }

        enum SalesPath: String, Codable {
            case documents
        }

        enum ServicePath: Codable {
            case tickets(id: Int?)
            init(id: Int? = nil) {
                self = .tickets(id: id)
            }

            var path: String {
                switch self {
                case .tickets(let id):
                    if let id {
                        return "/tickets/\(id)"
                    } else {
                        return "tickets"
                    }
                }
            }
        }

        enum SystemPath: String, Codable {
            case documents
        }
    }
}

struct RetryOptions {
    var retries: Int  // maximum number of retries
    var minTimeout: Int  // number of ms to wait between retries
    var maxTimeout: Int  // maximum number of ms between retries
    var randomize: Bool  // randomize delay between retries on timeouts
}

// ApiError for error handling
enum ApiError: Error {
    case invalidURL
}

extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

}
