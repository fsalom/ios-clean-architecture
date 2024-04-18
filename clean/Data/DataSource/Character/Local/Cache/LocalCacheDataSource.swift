//
//  RMLocalDataSource.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 28/6/23.
//

import Foundation

class LocalCacheDataSource: LocalCharacterDataSourceProtocol {
    var localManager: LocalManagerProtocol

    init(localManager: LocalManagerProtocol) {
        self.localManager = localManager
    }

    func getFavorites() async throws -> [RMCharacterDTO] {
        guard let favoritesDTO = localManager.retrieve(objectFor: "favorites", of: [RMCharacterDTO].self ) else { return []}
        return favoritesDTO
    }

    func saveFavorite(_ character: RMCharacterDTO) async throws {
        var favoritesDTO = try await self.getFavorites()
        favoritesDTO.removeAll(where: {$0.id == character.id})
        favoritesDTO.append(character)

        localManager.save(objectFor: "favorites", this: favoritesDTO)
    }

    func removeFavorite(_ character: RMCharacterDTO) async throws {
        var favoritesDTO = try await self.getFavorites()
        favoritesDTO.removeAll(where: {$0.id == character.id})

        localManager.save(objectFor: "favorites", this: favoritesDTO)
    }
}
