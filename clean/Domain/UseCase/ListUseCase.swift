//
//  ListUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 8/11/22.
//

import Foundation

final class ListUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

protocol ListUseCaseProtocol {
    func getCharactersList(page: Int) async throws -> ([CharacterDTO], Bool)
}

extension ListUseCase: ListUseCaseProtocol {
    func getCharactersList(page: Int) async throws -> ([CharacterDTO], Bool) {
        do {
            var hasNextPage = false
            let list = try await repository.getCharactersList(for: page)
            guard let nextPage = list.info.next else {
                hasNextPage = false
                return (list.results, hasNextPage)
            }
            hasNextPage = !nextPage.isEmpty ? true : false

            return (list.results, hasNextPage)
        } catch {
            throw error
        }

    }
}
