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
    var cacheManager: LocalManagerProtocol

    init(networkDatasource: CharacterDataSourceProtocol,
         localDatasource: CharacterDataSourceProtocol,
         cacheManager: LocalManagerProtocol) {
        self.networkDatasource = networkDatasource
        self.localDatasource = localDatasource
        self.cacheManager = cacheManager
    }

    func getPagination(for page: Int) async throws -> PaginationDTO {
        guard let localPagination = try await localDatasource.getPagination(for: page) else {
            let networkPagination = try await networkDatasource.getPagination(for: page)
            cacheManager.save(objectFor: "PAGE\(page)", this: networkPagination)
            return networkPagination!
        }
        return localPagination
    }

    func search(this name: String, for page: Int) async throws -> PaginationDTO {
        guard let localPagination = try await localDatasource.getPaginationWhenSearching(this: name, for: page) else {
            let networkPagination = try await networkDatasource.getPaginationWhenSearching(this: name, for: page)
            cacheManager.save(objectFor: "SEARCH\(name)\(page)", this: networkPagination)
            return networkPagination!
        }
        return localPagination
    }
}
