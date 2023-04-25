//
//  CharacterDTO.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

struct InfoDTO: Codable, DisneyInfoPaginationProtocol {
    var count: Int?
    var pages: Int?
    var next: String?

    // MARK: Diney pagination
    var nextPage: String?
    var totalPages: Int?
}

struct CharacterDTO: Codable,
                     CharacterProtocol,
                     RickAndMortyCharacterProtocol,
                     DisneyCharacterProtocol {
    // MARK: generic character
    var image: String?
    var name: String?

    // MARK: RickAndMorty character
    var status: String?
    var species: String?
    var type: String?
    var gender: String?

    // MARK: Diney character
    var imageUrl: String?
}

struct PaginationDTO: Codable {
    var info: InfoDTO
    var results: [CharacterDTO]?
    var data: [CharacterDTO]?
}
