//
//  CharacterDataSource.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

protocol CharacterDataSourceProtocol {
    func getPagination(for page: Int) async throws -> PaginationDTO
    func search(this name: String, for page: Int) async throws -> PaginationDTO
}

class CharacterDataSource: CharacterDataSourceProtocol {
    func getPagination(for page: Int) async throws -> PaginationDTO {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw CharacterRepositoryError.badURL
        }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw CharacterRepositoryError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    return try decoder.decode(PaginationDTO.self, from: data)
                } else {
                    throw CharacterRepositoryError.badResponse
                }
            } catch {
                throw CharacterRepositoryError.decodeError
            }
        } catch {
            throw CharacterRepositoryError.badRequest
        }
    }

    func search(this name: String, for page: Int) async throws -> PaginationDTO {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&page=\(page)") else {
            throw CharacterRepositoryError.badURL
        }
        let request = URLRequest(url: url)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw CharacterRepositoryError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    return try decoder.decode(PaginationDTO.self, from: data)
                } else {
                    throw CharacterRepositoryError.badResponse
                }
            } catch {
                throw CharacterRepositoryError.decodeError
            }
        } catch {
            throw CharacterRepositoryError.badRequest
        }
    }
}
