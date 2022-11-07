//
//  Container.swift
//  clean
//
//  Created by Fernando Salom Carratala on 7/11/22.
//

import UIKit

final class Container {
    weak var window: UIWindow?
    static let shared = Container()
}

extension Container {
    func willEnterForeground() {
        Container.shared.window?.rootViewController = HomeBuilder().build()
    }
}
