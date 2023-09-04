//
//  AppCoordinator.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 24/08/23.
//

// MARK: Para controlar hacia donde queremos ir

class AppCoordinator: Coordinator {
    // Obtenermos el contexto actual
    var context: Context?
    let apiCaller = ApiCaller()

    // Inicializamos el contexto y pasamos el contexto
    init(context: Context?) {
        // Le asignamos el contexto actual
        self.context = context
    }

    // Hacia donde lo dirigimos
    func start() {
        let viewController = MainViewController()
        viewController.viewModel = MainViewModel(apiCaller: apiCaller)
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
