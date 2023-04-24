//
//  CharacterDataSource.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

class RickAndMortyDataSource: CharacterDataSourceProtocol {
    var networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func getPagination(for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        return try await networkManager.call(this: request, of: PaginationDTO.self)
    }

    func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&page=\(page)") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        return try await networkManager.call(this: request, of: PaginationDTO.self)
    }
}
