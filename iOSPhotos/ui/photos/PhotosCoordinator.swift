//
//  PhotosCoordinator.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class PhotosCoordinator: BaseCoordinator {

    // MARK: - Navigation methods

    override func navigate(animated: Bool) {
        let photosViewController = PhotosViewController.fromStoryboard()
        photosViewController.viewModel = PhotosViewModel(networkClient: NetworkClient())
        photosViewController.coordinator = self
        navigationController.pushViewController(photosViewController, animated: animated)
    }

    func pushToDetail(_ photo: Photo) {
        let coordinator = PhotoDetailCoordinator(photo: photo, navigationController: navigationController)
        coordinator.navigate(animated: true)
    }
}
