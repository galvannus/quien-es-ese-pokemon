//
//  Context.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 24/08/23.
//

// MARK: - Flujo de navegación / ViewControllers por los que esta pasando la app

import UIKit

class Context {
    weak var coordinator: Coordinator?

    // Flujo NavigationController
    var navigationController: UINavigationController

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // Se inicializa Coordinator
    func initialize(coordinator: Coordinator) {
        // Se asigna coordinator
        self.coordinator = coordinator
        // Se utiliza el metodo start() del coordinator
        coordinator.start()
    }

    // MARK: - Flujo push

    func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
