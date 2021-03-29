//
//  View.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import UIKit

protocol View {
    associatedtype AssociatedViewModel
    var viewModel: AssociatedViewModel! { get set }
}
