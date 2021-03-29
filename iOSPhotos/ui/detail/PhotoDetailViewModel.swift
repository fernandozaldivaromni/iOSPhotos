//
//  PhotoDetailViewModel.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

class PhotoDetailViewModel: ViewModel {

    // MARK: - Properties

    var title: String
    let thumbnailUrl: String
    let photoTitle: String

    // MARK: - Initializer

    init(_ photo: Photo) {
        self.title = "Photo Detail"
        self.thumbnailUrl = photo.thumbnailUrl
        self.photoTitle = photo.title
    }

}
