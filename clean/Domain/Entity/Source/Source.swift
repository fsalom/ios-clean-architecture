//
//  Source.swift
//  clean
//
//  Created by Fernando Salom Carratala on 24/4/23.
//

import Foundation

class Source {
    var name: String
    var characterUseCase: CharacterUseCaseProtocol

    init(name: String, characterUseCase: CharacterUseCaseProtocol) {
        self.name = name
        self.characterUseCase = characterUseCase
    }
}
