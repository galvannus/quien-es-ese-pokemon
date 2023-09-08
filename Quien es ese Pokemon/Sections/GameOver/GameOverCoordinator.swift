//
//  GameOverCoordinator.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 06/09/23.
//

import Foundation

class GameOverCoordinator: Coordinator {
    var context: Context?

    init(context: Context) {
        self.context = context
    }

    func start() {
        let viewController = GameOverController()
        viewController.viewModel = GameOverModel()
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
