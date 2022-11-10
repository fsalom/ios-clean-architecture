//
//  HomeBuilder.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation
import UIKit

final class HomeBuilder: HomeBuilderProtocol {
    func build() -> HomeViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let repository = HomeRepository()
        let useCase = HomeUseCase(repository: repository)
        let viewModel = HomeViewModel(router: router, useCase: useCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
