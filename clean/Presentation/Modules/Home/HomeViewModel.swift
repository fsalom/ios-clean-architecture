//
//  HomeViewModel.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class HomeViewModel {
    let router: HomeRouterProtocol

    init(router: HomeRouterProtocol) {
        self.router = router
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func viewDidLoad() {
    }

    func goToList() {
        router.goToList()
    }
}
