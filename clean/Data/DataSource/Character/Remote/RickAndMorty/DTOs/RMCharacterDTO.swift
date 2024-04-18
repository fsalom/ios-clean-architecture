import Foundation

struct RMCharacterDTO: Codable {
    var id: Int
    var image: String?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var isFavorite: Bool? = false
}
