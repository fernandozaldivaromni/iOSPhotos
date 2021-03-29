//
//  PhotosViewModelTest.swift
//  iOSPhotosTests
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import XCTest
@testable import iOSPhotos

class PhotosViewModelTest: XCTestCase {

    var viewModel: PhotosViewModel!
    var errorViewModel: PhotosViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PhotosViewModel(networkClient: NetworkClient(configuration: MockService()))
        errorViewModel = PhotosViewModel(networkClient: NetworkClient(configuration: MockErrorService()))
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
        errorViewModel = nil
    }

    func testLoadMoreIfNeededTrue() {
        XCTAssertTrue(viewModel.loadMoreIfNeeded(index: 30))
    }

    func testLoadMoreIfNeededFalse() {
        XCTAssertFalse(viewModel.loadMoreIfNeeded(index: 0))
    }

    func testLoadPhotos() {
        let expectation = XCTestExpectation(description: "Request completed.")

        viewModel.loadPhotos { result in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Failed to fetch: \(error)")
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testLoadPhotosWithError() {
        let expectation = XCTestExpectation(description: "Request completed with error.")

        errorViewModel.loadPhotos { result in
            switch result {
            case .success:
                XCTFail("fetch successful")
            case .failure:
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testRestartPhotos() {
        viewModel.restartPhotos()
        XCTAssertTrue(viewModel.dataSource.isEmpty)
    }
}
