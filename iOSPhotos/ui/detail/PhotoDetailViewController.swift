//
//  PhotoDetailViewController.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class PhotoDetailViewController:  UIViewController, StoryboardBased, View, Coordinated {

    // MARK: - Outlets

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    // MARK: - Properties

    var coordinator: PhotoDetailCoordinator!
    var viewModel: PhotoDetailViewModel!

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: - Configure methods

    private func initialSetup() {
        self.title = viewModel.title
        self.titleLabel.text = viewModel.photoTitle
        thumbnailImageView.imageFromURL(urlString: viewModel.thumbnailUrl)
    }
}
