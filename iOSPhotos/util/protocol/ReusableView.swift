//
//  ReusableView.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    static var reusableIdentifier: String {
        let name = String(describing: self)
        return name
    }
}
