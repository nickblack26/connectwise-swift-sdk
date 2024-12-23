import Foundation

protocol Cacheable {
    associatedtype T: Codable = Self

    static var cache: NSCache<NSString, CacheEntryObject<T>> { get set }
    static var request: URLRequest { get set }
    
    static func fetch() async throws -> [T]
    static func create() async throws -> T
//    static func update() async throws -> T
    
//    static func fetch() async throws -> [T]
//    func getById(id: Int) async throws -> T
//    func patch(id: Int, body: [PatchOperation]) async throws -> T
//    func post(id: Int, body: T) async throws -> T
}
