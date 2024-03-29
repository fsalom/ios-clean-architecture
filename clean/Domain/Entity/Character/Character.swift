//
//  Character.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

class Character: CharacterProtocol {
    // MARK: Generic character
    var name: String?
    var image: String?

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

    init(dto: CharacterProtocol) {
        self.name = dto.name
        self.image = dto.image
    }
}
