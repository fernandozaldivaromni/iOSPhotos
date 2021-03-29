//
//  APIConfigurationProtocol.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

protocol APIConfigurationProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}

extension APIConfigurationProtocol {

    var scheme: String {
        return "https"
    }

    var host: String {
        return "jsonplaceholder.typicode.com"
    }
}
