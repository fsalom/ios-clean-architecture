//
//  ListRepository.swift
//  clean
//
//  Created by Fernando Salom Carratala on 8/11/22.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func getPagination(for page: Int) async throws -> PaginationDTO
    func search(this name: String, for page: Int) async throws -> PaginationDTO
}

final class CharacterRepository: CharacterRepositoryProtocol {
    var datasource: CharacterDataSourceProtocol

    init(datasource: CharacterDataSourceProtocol) {
        self.datasource = datasource
    }

    func getPagination(for page: Int) async throws -> PaginationDTO {
        return try await datasource.getPagination(for: page)
    }

    func search(this name: String, for page: Int) async throws -> PaginationDTO {
        return try await datasource.search(this: name, for: page)
    }
}
