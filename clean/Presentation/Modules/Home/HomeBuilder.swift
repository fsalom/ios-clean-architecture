//
//  HomeBuilder.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

final class HomeBuilder: BuilderProtocol {
    func build() -> BaseViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let repository = HomeRepository()
        let useCase = HomeUseCase(repository: repository)
        let viewModel = HomeViewModel(router: router, useCase: useCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
