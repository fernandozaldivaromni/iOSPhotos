//
//  PhotosService.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

class Service: ConfigurationProtocol {

    func request<T: Codable>(_ convertible: APIConfigurationProtocol, completion: @escaping (Result<[T], Error>) -> Void) {
        var components = URLComponents()
        components.scheme = convertible.scheme
        components.host = convertible.host
        components.path = convertible.path
        components.queryItems = convertible.parameters

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = convertible.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }

            guard response != nil, let data = data else { return }
            do {
                let responseObject = try JSONDecoder().decode([T].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
