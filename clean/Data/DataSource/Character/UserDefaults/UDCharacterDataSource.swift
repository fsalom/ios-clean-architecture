//
//  UDCharacterDataSource.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

class UDCharacterDataSource: CharacterDataSourceProtocol {
    var cacheManager: LocalManagerProtocol

    init(cacheManager: LocalManagerProtocol) {
        self.cacheManager = cacheManager
    }

    func getPagination(for page: Int) async throws -> PaginationDTO? {
        return cacheManager.retrieve(objectFor: "PAGE\(page)", of: PaginationDTO.self)
    }

    func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO? {
        return cacheManager.retrieve(objectFor: "SEARCH\(name)\(page)", of: PaginationDTO.self)
    }    
}
