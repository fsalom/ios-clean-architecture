//
//  DisneyCharacterUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 25/4/23.
//

import Foundation

final class DisneyCharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

extension DisneyCharacterUseCase: CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([CharacterProtocol], Bool) {
        let list = try await repository.getPagination(for: page)
        let hasNextPage = list.info.nextPage != nil
        return (convertToEntity(these: list.data), hasNextPage)
    }

    func getCharactersAndNextPageWhenSearching(this name: String,
                                               for page: Int) async throws -> ([CharacterProtocol], Bool) {
        let list = try await repository.getPaginationWhenSearching(this: name, for: page)
        let hasNextPage = list.info.next != nil
        return (convertToEntity(these: list.data), hasNextPage)
    }

    func convertToEntity(these dtos: [CharacterDTO]?) -> [CharacterProtocol] {
        var characters = [CharacterProtocol]()
        dtos?.forEach { characterDTO in
            characters.append(DisneyCharacter(dto: characterDTO))
        }
        return characters
    }
}
