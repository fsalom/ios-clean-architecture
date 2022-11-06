//
//  HomeUseCase.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class HomeUseCase {
    let repository: HomeRepositoryProtocol

    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
}

protocol HomeUseCaseProtocol {

}

extension HomeUseCase: HomeUseCaseProtocol {

}
