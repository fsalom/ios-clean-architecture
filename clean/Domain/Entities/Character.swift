import Foundation

struct Character: Identifiable, Equatable {
    enum RMStatus: String {
        case Dead
        case Alive
        case unknown
    }

    var id: Int
    var image: String
    var name: String
    var status: RMStatus
    var species: String
    var type: String
    var gender: String
    var isFavorite: Bool = false

    init(id: Int, name: String, image: String, status: RMStatus, species: String, type: String, gender: String) {
        self.id = id
        self.image = image
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
    }

    init() {
        self.id = 0
        self.image = ""
        self.name = ""
        self.status = .unknown
        self.species = ""
        self.type = ""
        self.gender = ""
    }
}
