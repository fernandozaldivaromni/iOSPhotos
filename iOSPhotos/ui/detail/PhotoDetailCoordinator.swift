//
//  PhotoDetailCoordinator.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class PhotoDetailCoordinator: BaseCoordinator {

    // MARK: - Properties

    private let photo: Photo

    // MARK: - Initializer

    init(photo: Photo, navigationController: UINavigationController = UINavigationController()) {
        self.photo = photo
        super.init(navigationController: navigationController)
    }

    // MARK: - Navigation methods

    override func navigate(animated: Bool) {
        let photoDetailViewController = PhotoDetailViewController.fromStoryboard()
        photoDetailViewController.viewModel = PhotoDetailViewModel(photo)
        photoDetailViewController.coordinator = self
        navigationController.pushViewController(photoDetailViewController, animated: animated)
    }
}
