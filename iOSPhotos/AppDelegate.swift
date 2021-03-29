//
//  AppDelegate.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: PhotosCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initialLoading()
        return true
    }

    // MARK - Initial loader

    private func initialLoading() {
        rootCoordinator = PhotosCoordinator(navigationController: UINavigationController())
        rootCoordinator.navigate(animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootCoordinator.navigationController
        window?.makeKeyAndVisible()
    }
}

