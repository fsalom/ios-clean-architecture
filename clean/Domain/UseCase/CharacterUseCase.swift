//
//  ListUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 8/11/22.
//

import Foundation


final class CharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

protocol CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([CharacterProtocol],
                                                                  Bool)
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([CharacterProtocol],
                                                                                                  Bool)
}

extension CharacterUseCase: CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([CharacterProtocol],
                                                                  Bool) {
        let list = try await repository.getPagination(for: page)
        let hasNextPage = list.info.next != nil
        return (convertToEntity(these: list.results), hasNextPage)
    }

    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([CharacterProtocol],
                                                                                                  Bool) {
        let list = try await repository.search(this: name, for: page)
        let hasNextPage = list.info.next != nil
        return (convertToEntity(these: list.results), hasNextPage)
    }

    func convertToEntity(these dtos: [CharacterDTO]) -> [CharacterProtocol] {
        var characters = [CharacterProtocol]()
        dtos.forEach { characterDTO in
            characters.append(Character(dto: characterDTO))
        }
        return characters
    }
}
