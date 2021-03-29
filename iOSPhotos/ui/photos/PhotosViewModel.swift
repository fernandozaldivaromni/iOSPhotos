//
//  PhotosViewModel.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class PhotosViewModel: ViewModel {

    // MARK: - Properties

    var title: String
    private(set) var dataSource: [PhotoCellViewModel]
    private var currentNextPage: Int
    private let loadMoreThreshold: Int
    private let itemCount: Int
    private var loadedIndex: Int
    private let networkClient: PerformRequestProtocol

    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, PhotoCellViewModel>

    var snapshot: Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(dataSource)
        return snapshot
    }

    // MARK: - Initializer

    init(networkClient: PerformRequestProtocol) {
        self.title = "Photos"
        self.dataSource = []
        self.currentNextPage = 1
        self.loadMoreThreshold = 5
        self.itemCount = 30
        self.loadedIndex = 0
        self.networkClient = networkClient
    }

    // MARK: - Networking methods

    func loadPhotos(completion: @escaping (Result<Bool, Error>) -> Void) {
        let router = Router.getPhotos(start: loadedIndex, limit: itemCount)
        networkClient.configuration.request(router) { [weak self] (result: Result<[Photo], Error>) in
            guard let self = self else { return }

            switch result {
            case .success(let photos):
                self.fillDataSource(photos)
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Configure methods

    private func fillDataSource(_ photos: [Photo]) {
        dataSource += photos.map { PhotoCellViewModel($0) }
    }

    // MARK: - Utility methods

    func loadMoreIfNeeded(index: Int) -> Bool {
        let threshold = (itemCount * currentNextPage) - loadMoreThreshold
        if loadedIndex < threshold && index >= threshold {
            loadedIndex = index + loadMoreThreshold
            currentNextPage += 1
            return true
        }

        return false
    }

    func restartPhotos() {
        dataSource.removeAll()
        self.currentNextPage = 1
        self.loadedIndex = 0
    }
}
