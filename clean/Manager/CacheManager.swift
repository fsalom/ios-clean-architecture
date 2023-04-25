//
//  Cache.swift
//  clean
//
//  Created by Fernando Salom Carratala on 21/4/23.
//

import Foundation

protocol LocalManagerProtocol {
    func save<T: Codable>(objectFor: String, this data: T)
    func retrieve<T: Decodable>(objectFor: String, of type: T.Type) -> T?
    func clear()
}

class CacheManager: LocalManagerProtocol {
    func save<T: Codable>(objectFor: String, this data: T) {
        guard let encodedData = try? JSONEncoder().encode(data) else {
            print("🤬 ERROR: Cache.save(objectFor: \(objectFor)) > JSON ENCODER ERROR")
            return
        }
        UserDefaults.standard.set(encodedData, forKey: objectFor)
    }

    func retrieve<T: Decodable>(objectFor: String, of type: T.Type) -> T? {
        guard let savedData = UserDefaults.standard.object(forKey: objectFor) as? Data  else { return nil }
        guard let object = try? JSONDecoder().decode(T.self, from: savedData) else { return nil }
        return object
    }

    func clear() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
