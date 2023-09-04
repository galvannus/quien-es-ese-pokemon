//
//  AppDelegate.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 23/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var context: Context?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        // Asignar rootViewController
        window?.rootViewController = UINavigationController()
        // Asigna Vista principal
        // window?.rootViewController = MainViewController()

        // Asigna Vista principal inicial rootViewController / se parsea a UINavigationController
        context = Context(with: window?.rootViewController as! UINavigationController)
        // Se inicializa el contexto
        context?.initialize(coordinator: AppCoordinator(context: context!))
        // Marca como principal este ViewController
        window?.makeKeyAndVisible()
        return true
    }
}
