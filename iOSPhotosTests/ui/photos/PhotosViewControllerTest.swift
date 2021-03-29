//
//  PhotosViewControllerTest.swift
//  iOSPhotosTests
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import XCTest
@testable import iOSPhotos

class PhotosViewControllerTest: XCTestCase {

    func testLaunchingFlow() {
        let navigationController = UINavigationController()
        let coordinator = PhotosCoordinator(navigationController: navigationController)
        coordinator.navigate(animated: false)

        XCTAssert(
            ((navigationController.viewControllers.last as? PhotosViewController) != nil), "Expected PhotosViewController."
        )
    }
}
