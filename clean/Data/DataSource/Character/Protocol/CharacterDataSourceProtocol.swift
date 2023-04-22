//
//  CharacterDataSourceProtocol.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

protocol CharacterDataSourceProtocol {
    func getPagination(for page: Int) async throws -> PaginationDTO?
    func search(this name: String, for page: Int) async throws -> PaginationDTO?
}
