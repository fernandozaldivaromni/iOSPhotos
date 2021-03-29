//
//  ConfigurationProtocol.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

protocol ConfigurationProtocol {
    func request<T: Codable>(_ convertible: APIConfigurationProtocol, completion: @escaping (Result<[T], Error>) -> Void)
}
