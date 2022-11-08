//
//  ListUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 8/11/22.
//

import Foundation

final class ListUseCase {
    let repository: ListRepositoryProtocol

    init(repository: ListRepositoryProtocol) {
        self.repository = repository
    }
}

protocol ListUseCaseProtocol {

}

extension ListUseCase: ListUseCaseProtocol {

}
