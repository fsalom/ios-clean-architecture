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
        let characterRepository = CharacterRepository()
        let useCase = ListUseCase(repository: characterRepository)
        let viewModel = ListViewModel(router: router, useCase: useCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
