//
//  NetworkError.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}
