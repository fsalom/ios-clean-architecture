//
//  Protocol.swift
//  clean
//
//  Created by Fernando Salom Carratala on 24/4/23.
//

import Foundation

protocol CharacterProtocol {
    var name: String? { get set }
    var image: String? { get set }
}

protocol RickAndMortyCharacterProtocol {
    var status: String? { get set }
    var species: String? { get set }
    var type: String? { get set }
    var gender: String? { get set }
}

protocol DisneyCharacterProtocol {
    var imageUrl: String? { get set }
}

protocol DisneyInfoPaginationProtocol {
    var nextPage: String? { get set }
    var totalPages: Int? { get set }
}

protocol DisneyPaginationProtocol {
    var data: [DisneyCharacterProtocol & CharacterProtocol] { get set }
}

protocol MarvelPaginationProtocol {
    var offset: Int? { get set }
    var limit: Int? { get set }
    var total: Int? { get set }
    var count: Int? { get set }
}

protocol MarvelCharacterProtocol {
    var id: Int? { get set }
    var thumbnail: MarvelImageDTO? { get set }
}
