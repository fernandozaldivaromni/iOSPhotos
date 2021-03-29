//
//  PerformRequestProtocol.swift
//  iOSPhotos
//
//  Created by Fernando Zaldivar on 3/22/21.
//

import Foundation

protocol PerformRequestProtocol {
    
    var configuration: ConfigurationProtocol { get }

    typealias RequestResult<T: Decodable> = (Swift.Result<T, Error>) -> Void
}
