//
//  HomeViewModel.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class HomeViewModel: HomeViewModelProtocol {
    let router: HomeRouterProtocol
    var useCase: HomeUseCaseProtocol

    init(router: HomeRouterProtocol, useCase: HomeUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }
}

extension HomeViewModel {
    func viewDidLoad() {

    }

    func viewDidAppear() {

    }

    func viewDidDisappear() {

    }
}
