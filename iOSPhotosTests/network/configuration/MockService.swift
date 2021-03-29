//
//  MockService.swift
//  iOSPhotosTests
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation
@testable import iOSPhotos

class MockService: ConfigurationProtocol {
    func request<T: Codable>(_ convertible: APIConfigurationProtocol, completion: @escaping (Result<[T], Error>) -> Void) {
        let mockFile = MockFile(configuration: convertible)
        let data = LoadFileUtility.loadJSONFile(fileName: mockFile.filePath)

        do {
            let response = try JSONDecoder().decode([T].self, from: data!)
            let result: Result<[T], Error> = .success(response)
            completion(result)
        }
        catch {
            completion(.failure(error))
        }
    }
}

class MockFile {
    private let configuration: APIConfigurationProtocol

    init(configuration: APIConfigurationProtocol) {
        self.configuration = configuration
    }

    var filePath: String {
        switch configuration {
        case
            Router.getPhotos:
            return "_photos"
        default:
            return ""
        }
    }
}
