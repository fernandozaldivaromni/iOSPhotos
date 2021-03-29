//
//  NibLoadableView.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {

    static var nibName: String {
        return String(describing: self)
    }

    private func loadViewFormXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView
    }

    func configureXib() {
        guard let subView = loadViewFormXib() else { return }
        subView.frame = bounds
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(subView)
    }
}
