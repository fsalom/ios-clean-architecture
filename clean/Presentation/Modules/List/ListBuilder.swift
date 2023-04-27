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
        let networkDatasource = RickAndMortyDataSource(networkManager: NetworkManager())
        let localDatasource = UDCharacterDataSource(cacheManager: CacheManager())
        let repository = CharacterRepository(networkDatasource: networkDatasource,
                                             localDatasource: localDatasource,
                                             cacheManager: CacheManager())
        let rickAndMortyUseCase = RickAndMortyCharacterUseCase(repository: repository)

        // MARK: - Disney
        let disneyDatasource = DisneyDataSource(networkManager: NetworkManager())
        let disneyRepository = CharacterRepository(networkDatasource: disneyDatasource,
                                             localDatasource: localDatasource,
                                             cacheManager: CacheManager())
        let disneyUseCase = DisneyCharacterUseCase(repository: disneyRepository)

        // MARK: - Marvel
        let marvelDatasource = MarvelDataSource(networkManager: NetworkManager())
        let marvelRepository = CharacterRepository(networkDatasource: marvelDatasource,
                                             localDatasource: localDatasource,
                                             cacheManager: CacheManager())
        let marvelUseCase = MarvelCharacterUseCase(repository: marvelRepository)

        // MARK: - Sources
        let rickAndMortySource = Source(name: "RickAndMorty", characterUseCase: rickAndMortyUseCase)
        let disneySource = Source(name: "Disney", characterUseCase: disneyUseCase)
        let marvelSource = Source(name: "Marvel", characterUseCase: marvelUseCase)

        // MARK: - ViewModel
        let viewModel = ListViewModel(router: router,
                                      sources: [rickAndMortySource, disneySource, marvelSource])

        viewController.viewModel = viewModel
        return viewController
    }
}
