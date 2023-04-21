//
//  HomeProtocols.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

protocol HomeBuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {
    func goToList()
}

protocol HomeViewModelProtocol {
    func viewDidLoad()
    func goToList()
}
