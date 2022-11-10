//
//  HomeViewModel.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class ListViewModel: ListViewModelProtocol {
    let router: ListRouterProtocol
    var useCase: ListUseCaseProtocol

    var characters = [CharacterDTO]() {        
        didSet {
            listCharactersUpdated?()
        }
    }
    var hasNextPage = false
    var listCharactersUpdated: (() -> Void)?
    var errorHasOcurred: ((Error) -> Void)?

    init(router: ListRouterProtocol, useCase: ListUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }
}

extension ListViewModel {
    //MARK: Life cycle
    func viewDidLoad() {
        Task{
            do {
                (self.characters, self.hasNextPage) = try await useCase.getCharactersList(page: 1)
            } catch {
                errorHasOcurred?(error)
            }
        }
    }

    func viewDidAppear() {

    }

    func viewDidDisappear() {

    }

    //MARK: Actions
    func loadMoreCharacter(currentItem: Int){
        if (characters.count - 5 < currentItem) && hasNextPage {
            Task {
                do {
                    (self.characters, self.hasNextPage) = try await useCase.getCharactersList(page: 1)
                } catch {
                    print(error)
                }
            }
        }
    }
}
