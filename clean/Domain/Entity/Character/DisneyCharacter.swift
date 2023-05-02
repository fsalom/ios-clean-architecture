//
//  DisneyCharacter.swift
//  clean
//
//  Created by Fernando Salom Carratala on 25/4/23.
//

import Foundation


class DisneyCharacter: CharacterProtocol, DisneyCharacterProtocol {
    // MARK: Generic protocol
    var name: String?
    var image: String?
    var imageUrl: String?

    init(dto: CharacterProtocol & DisneyCharacterProtocol) {
        // MARK: Generic protocol
        self.name = dto.name
        self.image = dto.imageUrl

        // MARK: Disney protocol
        self.imageUrl = dto.imageUrl
    }
}
