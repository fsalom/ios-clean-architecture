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
                     DisneyCharacterProtocol,
                     MarvelCharacterProtocol {


    // MARK: generic character
    var image: String?
    var name: String?

    // MARK: RickAndMorty character
    var status: String?
    var species: String?
    var type: String?
    var gender: String?

    // MARK: Disney character
    var imageUrl: String?

    // MARK: Marvel character
    var id: Int?
    var thumbnail: MarvelImageDTO?
}

struct PaginationDTO: Codable, MarvelPaginationProtocol {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var info: InfoDTO?
    var results: [CharacterDTO]?
    var data: [CharacterDTO]?
}


