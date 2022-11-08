//
//  HomeProtocols.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

protocol ListBuilderProtocol: BuilderProtocol {
    func build() -> ListViewController
}

protocol ListRouterProtocol {
    
}

protocol ListViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()
}
