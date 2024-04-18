//
//  RickAndMortyRepository.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 15/6/23.
//

import Foundation

final class CharacterRepository: CharacterRepositoryProtocol {
    var networkDatasource: RMCharacterDataSourceProtocol

    init(networkDatasource: RMCharacterDataSourceProtocol) {
        self.networkDatasource = networkDatasource
    }

    func getPagination(for page: Int) async throws -> Pagination {        
        let networkPagination = try await networkDatasource.getPagination(for: page)
        guard let pagination = networkPagination else {
            return Pagination(hasNextPage: false, characters: [])
        }
        return pagination.toDomain()
    }

    func getPaginationWhenSearching(this name: String, for page: Int) async throws -> Pagination {
        let networkPagination = try await networkDatasource.getPaginationWhenSearching(this: name, for: page)
        guard let pagination = networkPagination else {
            return Pagination(hasNextPage: false, characters: [])
        }
        return pagination.toDomain()
    }
}
