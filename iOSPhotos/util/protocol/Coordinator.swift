//
//  Coordinator.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

protocol Coordinator {

    // MARK: - Properties

    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    // MARK: - Utility methods
    
    func navigate(animated: Bool)
}
