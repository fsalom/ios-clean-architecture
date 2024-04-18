//
//  RickAndMortyDataSourceProtocol.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 15/6/23.
//

import Foundation

protocol RMCharacterDataSourceProtocol {
    func getPagination(for page: Int) async throws -> PaginationDTO?
    func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO?
}
