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
        let networkDatasource = RickAndMortyDataSource()
        let localDatasource = UDCharacterDataSource()
        let repository = CharacterRepository(networkDatasource: networkDatasource,
                                             localDatasource: localDatasource)
        let useCase = CharacterUseCase(repository: repository)
        let viewModel = ListViewModel(router: router, characterUseCase: useCase)

        viewController.viewModel = viewModel
        return viewController
    }
}
