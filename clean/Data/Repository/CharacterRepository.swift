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
    var networkDatasource: CharacterDataSourceProtocol
    var localDatasource: CharacterDataSourceProtocol

    init(networkDatasource: CharacterDataSourceProtocol,
         localDatasource: CharacterDataSourceProtocol) {
        self.networkDatasource = networkDatasource
        self.localDatasource = localDatasource
    }

    func getPagination(for page: Int) async throws -> PaginationDTO {
        guard let localPagination = try await localDatasource.getPagination(for: page) else {
            let networkPagination = try await networkDatasource.getPagination(for: page)
            Cache.save(objectFor: "PAGE\(page)", this: networkPagination)
            return networkPagination!
        }
        return localPagination
    }

    func search(this name: String, for page: Int) async throws -> PaginationDTO {
        guard let localPagination = try await localDatasource.search(this: name, for: page) else {
            let networkPagination = try await networkDatasource.search(this: name, for: page)
            Cache.save(objectFor: "PAGE\(page)", this: networkPagination)
            return networkPagination!
        }
        return localPagination
    }
}
