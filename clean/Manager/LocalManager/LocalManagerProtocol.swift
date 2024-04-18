//
//  LocalManagerProtocol.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 15/11/23.
//

import Foundation

protocol LocalManagerProtocol {
    func save<T: Codable>(objectFor: String, this data: T)
    func retrieve<T: Decodable>(objectFor: String, of type: T.Type) -> T?
    func clear()
}
