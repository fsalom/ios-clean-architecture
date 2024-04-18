//
//  NetworkManagerProtocol.swift
//  RudoUI
//
//  Created by Fernando Salom Carratala on 15/11/23.
//

import Foundation

protocol RemoteManagerProtocol {
    func call<T: Decodable>(this url: URLRequest, of type: T.Type) async throws -> T
}
