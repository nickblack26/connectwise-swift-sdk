import Foundation

extension Cacheable {
    static func fetch() async throws -> [T] {
        if let cached = self.cache[self.request.url?.absoluteString ?? ""] {
            switch cached {
            case .ready(let item):
                return item
            case .inProgress(let task):
                return try await task.value
            }
        }
        
        let task = Task<T, Error> {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            return try JSONDecoder().decode([T].self, from: data)
        }
        
        cache[self.request.url?.absoluteString ?? ""] = .inProgress(task<>)
        
        do {
            let item = try await task.value
            cache[request.url] = .ready(item)
            return item
        } catch {
            quakeCache[url] = nil
            throw error
        }
    }
    
//    static func create() async throws -> T {
//        let (data, response) = try await URLSession.shared.data(for: request)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        return try JSONDecoder().decode([T].self, from: data)
//    }
}
