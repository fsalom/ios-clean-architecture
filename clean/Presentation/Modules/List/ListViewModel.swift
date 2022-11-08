//
//  HomeViewModel.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class ListViewModel: ListViewModelProtocol {
    let router: ListRouterProtocol
    var useCase: ListUseCaseProtocol

    init(router: ListRouterProtocol, useCase: ListUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }
}

extension ListViewModel {
    func viewDidLoad() {

    }

    func viewDidAppear() {

    }

    func viewDidDisappear() {

    }
}
