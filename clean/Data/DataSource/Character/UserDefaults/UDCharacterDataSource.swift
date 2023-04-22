//
//  UDCharacterDataSource.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

class UDCharacterDataSource: CharacterDataSourceProtocol {
    func getPagination(for page: Int) async throws -> PaginationDTO? {
        return Cache.retrieve(objectFor: "PAGE\(page)", of: PaginationDTO.self)
    }

    func search(this name: String, for page: Int) async throws -> PaginationDTO? {
        return Cache.retrieve(objectFor: "SEARCH\(name)\(page)", of: PaginationDTO.self)
    }    
}
