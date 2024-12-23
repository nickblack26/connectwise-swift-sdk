import Foundation

actor ServiceClient {
    let url: URL
    private let headers: [String: String]
    var cache: NSCache<NSString, CacheEntryObject>

    let tickets: TicketClient

    init(
        url: URL,
        headers: [String: String]
    ) {
        self.url = url
        self.headers = headers
    }

    enum Path: Codable {
        case tickets
        case ticket(id: Int)
        case ticketCopy(id: Int)
        case ticketActivities(id: Int)
        case ticketActivitiesCount(id: Int)
        case ticketAttachChildren(id: Int)
        case ticketConfigurations(id: Int)

        var type: Codable.Type {
            switch self {
            case .tickets:
                return [Ticket].self
            default: return Ticket.self
            }
        }

        var path: String {
            switch self {
            case .tickets:
                "/tickets"
            case .ticket(let id):
                "/tickets/\(id)"
            default: "/tickets"
            }
        }
    }

    func get(path: Path) async throws -> any Codable {
        var request = URLRequest(url: self.url.appendingPathComponent(path.path))
        request.allHTTPHeaderFields = self.headers
        let (data, response) = try await URLSession.shared.data(for: request)

        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            throw URLError(.badServerResponse)
        }

        print(path.type)

        return try JSONDecoder().decode(path.type.self, from: data)
    }
}

enum CacheEntry<T: Codable> {
    case inProgress(Task<T, Error>)
    case ready(T)
}

final class CacheEntryObject<T: Codable> {
    let entry: CacheEntry<T>
    init(entry: CacheEntry<T>) { self.entry = entry }
}

struct PatchOperation: Codable {
    let op: Operation
    let path: String
    let value: String

    enum Operation: String, Codable {
        case add, replace, remove
    }
}

//extension Cachable {
//    func get(path: String) async throws -> T {
//        if let cached = cache[path] {
//            switch cached {
//            case .ready(let item):
//                return item as! T
//            case .inProgress(let task):
//                return try await task.value as! T
//            }
//        }
//
//        let task = Task<Any, Error> {
//            var request = self.request
//            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
//            request.httpMethod = "GET"
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let decodedData = try JSONDecoder().decode(type, from: data)
//            return decodedData
//        }
//
//        cache[module.endpoint] = .inProgress(task)
//
//        do {
//            let item = try await task.value
//            cache[module.endpoint] = .ready(item)
//            return item as! T
//        } catch {
//            cache[module.endpoint] = nil
//            throw error
//        }
//    }
//}
//
