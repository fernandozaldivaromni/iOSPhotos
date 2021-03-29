//
//  PhotosRouter.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

enum Router: APIConfigurationProtocol {

    case getPhotos(start: Int, limit: Int)

    var path: String {
        return "/photos"
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getPhotos(let start, let limit):
            return [URLQueryItem(name: "_start", value: start.description),
                    URLQueryItem(name: "_limit", value: limit.description)]
        }
    }

    var method: String {
        return "GET"
    }
}
