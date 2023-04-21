//
//  ListUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 8/11/22.
//

import Foundation

enum CharacterUseCaseError: Error{
    case badURL
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}

final class CharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

protocol CharacterUseCaseProtocol {
    func getList(for page: Int) async throws -> ([Character], Bool)
    func search(this name: String, for page: Int) async throws -> ([Character], Bool)
}

extension CharacterUseCase: CharacterUseCaseProtocol {
    func getList(for page: Int) async throws -> ([Character], Bool) {
        do {
            var hasNextPage = false
            let list = try await repository.getPagination(for: page)
            guard let nextPage = list.info.next else {
                hasNextPage = false
                return (convertToEntity(these: list.results), hasNextPage)
            }
            hasNextPage = !nextPage.isEmpty ? true : false
            return (convertToEntity(these: list.results), hasNextPage)
        } catch {
            throw error
        }
    }

    func search(this name: String, for page: Int) async throws -> ([Character], Bool) {
        do {
            var hasNextPage = false
            let list = try await repository.search(this: name, for: page)
            guard let nextPage = list.info.next else {
                hasNextPage = false
                return (convertToEntity(these: list.results), hasNextPage)
            }
            hasNextPage = !nextPage.isEmpty ? true : false
            return (convertToEntity(these: list.results), hasNextPage)
        } catch {
            throw error
        }
    }

    func convertToEntity(these dtos: [CharacterDTO]) -> [Character] {
        var characters = [Character]()
        dtos.forEach { characterDTO in
            characters.append(Character(dto: characterDTO))
        }
        return characters
    }
}
