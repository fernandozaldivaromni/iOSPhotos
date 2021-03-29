//
//  BaseCoordinator.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class BaseCoordinator: Coordinator {

    // MARK: - Properties

    var children = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Utility methods

    func navigate(animated: Bool) { }
}
