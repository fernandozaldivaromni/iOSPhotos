//
//  UIImageView+Downloader.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func imageFromURL(urlString: String, needsActivityIndicator: Bool = true) {
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = imageFromCache
            return
        }

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)

        if image == nil {
            activityIndicator.startAnimating()
            if needsActivityIndicator {
                addSubview(activityIndicator)
            }
        }

        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    activityIndicator.removeFromSuperview()
                }

                return
            }

            DispatchQueue.main.async {
                activityIndicator.removeFromSuperview()
                self?.image = image
                self?.saveImageIfPossible(key: urlString)
            }
        }
    }

    private func saveImageIfPossible(key: String) {
        guard let image = image else { return }
        imageCache.setObject(image, forKey: key as AnyObject)
    }
}
