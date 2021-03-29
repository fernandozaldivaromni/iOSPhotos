//
//  PhotoDetailViewControllerTest.swift
//  iOSPhotosTests
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import XCTest
@testable import iOSPhotos

class PhotoDetailViewControllerTest: XCTestCase {

    func testLaunchingFlow() {
        let navigationController = UINavigationController()
        let photo = Photo()
        let coordinator = PhotoDetailCoordinator(photo: photo, navigationController: navigationController)
        coordinator.navigate(animated: false)

        XCTAssert(
            ((navigationController.viewControllers.last as? PhotoDetailViewController) != nil), "Expected PhotoDetailViewController."
        )
    }

}
