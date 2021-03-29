//
//  NetworkClient.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

class NetworkClient: PerformRequestProtocol {

    // MARK: - Property

    var configuration: ConfigurationProtocol

    // MARK: - Initializer

    init(configuration: ConfigurationProtocol = Service()) {
        self.configuration = configuration
    }
}
