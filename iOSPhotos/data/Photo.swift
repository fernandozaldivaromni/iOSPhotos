//
//  Photos.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

struct Photo: Codable {

    // MARK: - Properties

    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    // MARK: - Initializer

    init() {
        self.id = 0
        self.title = ""
        self.url = ""
        self.thumbnailUrl = ""
    }
}

