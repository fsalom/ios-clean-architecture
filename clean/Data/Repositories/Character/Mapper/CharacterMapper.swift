//
//  PaginationMapper.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 17/11/23.
//

import Foundation

extension RMCharacterDTO {
    func toDomain() -> Character {
        let status = Character.RMStatus(rawValue: self.status ?? "unknown") ?? .unknown
        let isFavorite = self.isFavorite != nil ? self.isFavorite : false
            return .init(id: self.id,
                         name: self.name ?? "",
                         image: self.image ?? "",
                         status: status,
                         species: self.species ?? "",
                         type: self.type ?? "",
                         gender: self.gender ?? ""
        )
    }
}

extension PaginationDTO {
    func toDomain() -> Pagination {
        .init(hasNextPage: self.info?.next != nil,
              characters: self.results?.map({ $0.toDomain() }) ?? [])
    }
}

extension Character {
    func toDTO() -> RMCharacterDTO {
        .init(id: self.id,
              image: self.image,
              name: self.name,
              status: self.status.rawValue,
              species: self.species,
              type: self.type,
              gender: self.gender,
              isFavorite: self.isFavorite)
    }
}
