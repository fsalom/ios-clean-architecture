//
//  RickAndMortyCharacter.swift
//  clean
//
//  Created by Fernando Salom Carratala on 24/4/23.
//

import Foundation

class RickAndMortyCharacter: CharacterProtocol,
                             RickAndMortyCharacterProtocol {
    // MARK: Generic protocol
    var name: String?
    var image: String?
    // MARK: RickAndMorty protocol
    var status: String? = ""
    var species: String? = ""
    var type: String? = ""
    var gender: String? = ""

    init(dto: CharacterProtocol & RickAndMortyCharacterProtocol) {
        // MARK: Generic protocol
        self.name = dto.name
        self.image = dto.image
        // MARK: RickAndMorty protocol
        self.status = dto.status
        self.species = dto.species
        self.type = dto.type
        self.gender = dto.gender
    }
}
