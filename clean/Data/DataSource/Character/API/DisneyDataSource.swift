//
//  DisneyDataSource.swift
//  clean
//
//  Created by Fernando Salom Carratala on 25/4/23.
//

import Foundation

class DisneyDataSource: CharacterDataSourceProtocol {
    var networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func getPagination(for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string:
                                "https://api.disneyapi.dev/character/?page=\(page)") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        return try await networkManager.call(this: request, of: PaginationDTO.self)
    }

    func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://api.disneyapi.dev/character/?name=\(name)") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        return try await networkManager.call(this: request, of: PaginationDTO.self)
    }
}
