//
//  PhotosViewController.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class PhotosViewController: UIViewController, StoryboardBased, View, Coordinated {

    // MARK: - Outlets

    @IBOutlet var photosCollectionView: UICollectionView!

    // MARK: - Properties

    var coordinator: PhotosCoordinator!
    var viewModel: PhotosViewModel!

    typealias PhotosDataSource = UICollectionViewDiffableDataSource<Int, PhotoCellViewModel>

    private var collectionViewDataSource: PhotosDataSource!
    private var refreshControl: UIRefreshControl!
    private var firstLoading = true

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: - Configuration methods

    private func initialSetup() {
        self.title = viewModel.title
        configureResfreshControl()
        configureCollectionView()
        loadPhotos()
        print("Bugfix 1")
    }

    private func configureResfreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshPhotos), for: .valueChanged)
    }

    private func configureCollectionView() {
        photosCollectionView.registerCell(PhotoCollectionViewCell.self)
        photosCollectionView.addSubview(refreshControl)
        collectionViewDataSource = prepareDataSource()
        collectionViewDataSource.apply(viewModel.snapshot, animatingDifferences: true)
    }

    // MARK: - Utility methods

    private func loadPhotos() {
        checkFirstLoading()
        viewModel.loadPhotos { [weak self] result in
            guard let self = self else { return }

            LoadingOverlay.shared.hideOverlayView()
            self.refreshControl.endRefreshing()
            switch result {
            case .success:
                self.collectionViewDataSource.apply(self.viewModel.snapshot, animatingDifferences: false)
            case .failure(let error):
                self.showError(error)
            }
        }
    }

    private func loadMoreIfNeeded(from index: Int) {
        guard viewModel.loadMoreIfNeeded(index: index) else { return }
        loadPhotos()
    }

    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    private func checkFirstLoading() {
        if firstLoading {
            LoadingOverlay.shared.showOverlay()
            firstLoading = false
        }
    }

    @objc private func refreshPhotos() {
        viewModel.restartPhotos()
        loadPhotos()
        refreshControl.endRefreshing()
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController {

    private func prepareDataSource() -> PhotosDataSource {
        return UICollectionViewDiffableDataSource(
            collectionView: photosCollectionView,
            cellProvider: { [unowned self] collectionView, indexPath, cellViewModel -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as PhotoCollectionViewCell
                cell.configureCell(cellViewModel)
                self.loadMoreIfNeeded(from: indexPath.row)
                return cell
            }
        )
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 4
        return CGSize(width: width, height: width)
    }
}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = viewModel.dataSource[indexPath.row].photo
        coordinator.pushToDetail(photo)
    }
}
