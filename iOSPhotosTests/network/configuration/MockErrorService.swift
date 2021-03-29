//
//  MockErrorService.swift
//  iOSPhotosTests
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation
@testable import iOSPhotos

class MockErrorService: ConfigurationProtocol {

    func request<T: Codable>(_ convertible: APIConfigurationProtocol, completion: @escaping (Result<[T], Error>) -> Void) {
        let error = NSError(domain: "500", code: 500, userInfo: [:])
        completion(.failure(error))
    }
}
