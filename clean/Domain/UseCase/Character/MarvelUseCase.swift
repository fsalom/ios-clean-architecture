//
//  MarvelUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 26/4/23.
//

import Foundation

final class MarvelCharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

extension MarvelCharacterUseCase: CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([CharacterProtocol],
                                                                  Bool) {
        let list = try await repository.getPagination(for: page)
        let hasNextPage = (list.results?.count ?? 0) < 20 ? false : true
        return (convertToEntity(these: list.results), hasNextPage)
    }

    func getCharactersAndNextPageWhenSearching(this name: String,
                                               for page: Int) async throws -> ([CharacterProtocol],
                                                                               Bool) {
        let list = try await repository.getPaginationWhenSearching(this: name, for: page)
        let hasNextPage = (list.results?.count ?? 0) < 20 ? false : true
        return (convertToEntity(these: list.data), hasNextPage)
    }

    func convertToEntity(these dtos: [CharacterDTO]?) -> [CharacterProtocol] {
        var characters = [CharacterProtocol]()
        dtos?.forEach { characterDTO in
            characters.append(MarvelCharacter(dto: characterDTO))
        }
        return characters
    }
}
