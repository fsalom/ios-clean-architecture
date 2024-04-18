//
//  CharacterUseCaseProtocol.swift
//  clean
//
//  Created by Fernando Salom Carratala on 26/4/23.
//

import Foundation

protocol CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([CharacterProtocol],
                                                                  Bool)
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([CharacterProtocol],
                                                                                                  Bool)
}
