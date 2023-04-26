//
//  MarvelDataSource.swift
//  clean
//
//  Created by Fernando Salom Carratala on 25/4/23.
//

import Foundation

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

class MarvelDataSource: CharacterDataSourceProtocol {
    var networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func getPagination(for page: Int) async throws -> PaginationDTO? {

        guard let url = URL(string:
                                "https://gateway.marvel.com:443/v1/public/characters?offset=\(20*page)&limit=20&\(getAuthenticationPath())") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        let marvel = try await networkManager.call(this: request, of: MarvelDTO.self)
        return marvel.data
    }

    func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?name=\(name)&\(getAuthenticationPath())") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        return try await networkManager.call(this: request, of: PaginationDTO.self)
    }

    private func hash() -> (String, String) {
        let ts = Int(Date().timeIntervalSince1970)
        let MD5 = MD5(string: "\(ts)6f56e50e1548978fb1ae4fd60ae19a07256980b269b9839045fcbb4a98d1daa15b1733f0")
        let md5Hex = MD5.map { String(format: "%02hhx", $0) }.joined()
        return (String(ts), md5Hex)
    }

    private func getAuthenticationPath() -> String {
        let (ts, hash) = hash()
        return "apikey=69b9839045fcbb4a98d1daa15b1733f0&ts=\(ts)&hash=\(hash)"
    }

    private func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using: .utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
}
