import Foundation

struct InfoDTO: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
}

struct PaginationDTO: Codable {
    var info: InfoDTO?
    var results: [RMCharacterDTO]?
}
