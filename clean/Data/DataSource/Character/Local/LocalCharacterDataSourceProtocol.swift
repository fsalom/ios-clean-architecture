//
//  LocalCharacterDataSourceProtocol.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 14/11/23.
//

import Foundation

protocol LocalCharacterDataSourceProtocol {
    func getFavorites() async throws -> [RMCharacterDTO]
    func saveFavorite(_ character: RMCharacterDTO)  async throws
    func removeFavorite(_ character: RMCharacterDTO)  async throws
}
