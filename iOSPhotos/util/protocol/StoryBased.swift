//
//  StoryBased.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

protocol StoryboardBased {
    static func fromStoryboard() -> Self
}

extension StoryboardBased where Self: UIViewController {

    static func fromStoryboard() -> Self {
        guard let name = description().components(separatedBy: ".").last?
            .replacingOccurrences(of: "ViewController", with: "") else {
                return Self.init(nibName: nil, bundle: nil)
        }

        let storyboard = UIStoryboard(name: name, bundle: nil)

        // swiftlint:disable force_cast
        return storyboard.instantiateInitialViewController() as! Self
    }
}
