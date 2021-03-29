//
//  PhotoCellViewModel.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

class PhotoCellViewModel: CellViewModel {

    // MARK: - Properties

    let imageUrl: String
    let photo: Photo

    // MARK: - Initializer

    init(_ photo: Photo) {
        self.photo = photo
        self.imageUrl = photo.url
        super.init(photo.title)
    }
}
