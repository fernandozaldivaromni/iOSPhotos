//
//  Coordinated.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

protocol Coordinated {
    associatedtype AssociatedCoordinator
    var coordinator: AssociatedCoordinator! { get set }
}
