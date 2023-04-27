//
//  HomeViewModel.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class ListViewModel: ListViewModelProtocol {
    let router: ListRouterProtocol
    var characterUseCase: CharacterUseCaseProtocol {
        didSet {
            characters.removeAll()
            hasNextPage = true
            page = 1
            CacheManager().clear()
            loadCharacters()
        }
    }

    enum Status {
        case searching
        case listing
    }

    var currentSearch: String = "" {
        willSet {
            if newValue == currentSearch { return }
            characters = []
            hasNextPage = true
            page = 1
            currentStatus = currentSearch.isEmpty ? .listing : .searching
        }
    }
    var currentStatus: Status = .listing
    var dataSources: [String] {
        return sources.compactMap({$0.name})
    }
    var characters = [CharacterProtocol]() {
        didSet {
            listCharactersUpdated?()
        }
    }
    var hasNextPage = true {
        didSet {
            if hasNextPage == true {
                page += 1
            }
        }
    }
    var page: Int = 1

    var sources: [Source]
    var listCharactersUpdated: (() -> Void)?
    var errorHasOcurred: ((Error) -> Void)?

    init(router: ListRouterProtocol, sources: [Source]) {
        self.router = router
        self.sources = sources
        self.characterUseCase = sources.first!.characterUseCase
    }
}

extension ListViewModel {
    //MARK: Life cycle
    func viewDidLoad() {
        loadCharacters()
    }

    //MARK: Actions
    func loadMoreCharacter(currentItem: Int){
        if (characters.count - 5 < currentItem) && hasNextPage {
            switch currentStatus {
            case .searching:
                search(this: currentSearch)
            case .listing:
                loadCharacters()
            }
        }
    }

    func sourceChanged(to: Int) {
        characterUseCase = sources[to].characterUseCase
    }

    func loadCharacters() {
        if !hasNextPage { return }
        Task {
            do {
                let (characters, hasNextPage) = try await characterUseCase.getCharactersAndNextPage(for: page)
                self.characters.append(contentsOf: characters)
                self.hasNextPage = hasNextPage
                self.listCharactersUpdated?()
            } catch {
                errorHasOcurred?(error)
            }
        }
    }

    func search(this name: String) {
        if name.isEmpty {
            reset()
            loadCharacters()
            return
        }
        currentSearch = name
        if !hasNextPage { return }
        Task {
            do {
                let (characters, hasNextPage) = try await characterUseCase.getCharactersAndNextPageWhenSearching(this: name,
                                                                                                                 for: page)
                self.characters.append(contentsOf: characters)
                self.hasNextPage = hasNextPage
            } catch {
                errorHasOcurred?(error)
            }
        }
    }

    func reset() {
        page = 0
        characters = []
    }
}
