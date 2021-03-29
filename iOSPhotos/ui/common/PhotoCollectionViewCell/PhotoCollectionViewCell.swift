//
//  PhotoCollectionViewCell.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/23/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet var photoImageView: UIImageView!
    

    // MARK: Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    // MARK: - Configuration methods

    func configureCell(_ viewModel: PhotoCellViewModel) {
        photoImageView.imageFromURL(urlString: viewModel.imageUrl)
    }
}
