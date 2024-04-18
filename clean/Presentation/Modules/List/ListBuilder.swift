//
//  ListBuilder.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

final class ListBuilder: ListBuilderProtocol {
    func build() -> ListViewController {
        let viewController = ListViewController()
        let router = ListRouter(viewController: viewController)

        // MARK: - Rick and Morty
        let networkDatasource = RMRemoteDataSource(networkManager: NetworkManager())
        let repository = CharacterRepository(networkDatasource: networkDatasource)
        let rickAndMortyUseCase = CharacterUseCase(repository: repository)

        // MARK: - ViewModel
        let viewModel = ListViewModel(router: router,
                                      useCase: rickAndMortyUseCase)

        viewController.viewModel = viewModel
        return viewController
    }
}
