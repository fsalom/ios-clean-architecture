//
//  HomeProtocols.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

protocol ListBuilderProtocol {
    func build() -> ListViewController
}

protocol ListRouterProtocol { }

protocol ListViewModelProtocol {
    func viewDidLoad()
    func loadMoreCharacter(currentItem: Int)
    func search(this name: String)
    var characters: [Character] { get set }
    var currentSearch: String { get set }
    var currentStatus: ListViewModel.Status { get set }
    var listCharactersUpdated: (() -> Void)? { get set }
    var errorHasOcurred: ((Error) -> Void)? { get set }
}
