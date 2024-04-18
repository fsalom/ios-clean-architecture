//
//  MarvelCharacterDTO.swift
//  clean
//
//  Created by Fernando Salom Carratala on 26/4/23.
//

import Foundation

struct MarvelDTO: Codable {
    var data: PaginationDTO
}

struct MarvelImageDTO: Codable {
    var path: String
    var type: String

    enum CodingKeys: String, CodingKey {
        case path = "path"
        case type = "extension"
    }
}
