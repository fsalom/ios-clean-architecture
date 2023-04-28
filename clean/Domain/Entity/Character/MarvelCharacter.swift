//
//  MarvelCharacter.swift
//  clean
//
//  Created by Fernando Salom Carratala on 26/4/23.
//

import Foundation

class MarvelCharacter: CharacterProtocol & MarvelCharacterProtocol {
    // MARK: Generic protocol
    var name: String?
    var image: String?
    // MARK: Marvel protocol
    var id: Int?
    var thumbnail: MarvelImageDTO?

    init(dto: CharacterProtocol & MarvelCharacterProtocol) {
        // MARK: Generic protocol
        self.name = dto.name
        self.id = dto.id
        if let path = dto.thumbnail?.path, let type = dto.thumbnail?.type {
            self.image = path + "." + type
        }
    }
}
