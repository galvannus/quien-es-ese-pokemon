//
//  MainViewCoordinator.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 06/09/23.
//

class MainViewCoordinator: Coordinator {
    var context: Context?
    let apiCaller = ApiCaller()

    init(context: Context) {
        self.context = context
    }

    func start() {
        let viewController = MainViewController()
        viewController.viewModel = MainViewModel(apiCaller: apiCaller)
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
