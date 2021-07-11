//
//  AnimalService.swift
//  Africa
//
//  Created by Accounting on 11/07/21.
//

import Foundation
import Combine

protocol AnimalService {
    func request(from endpoint: AnimalAPI) -> AnyPublisher<Animals, APIError>
}

struct AnimalServiceImpl: AnimalService {
    func request(from endpoint: AnimalAPI) -> AnyPublisher<Animals, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
            .flatMap { data, response -> AnyPublisher<Animals, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if(200...2999).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    return Just(data)
                        .decode(type: Animals.self, decoder: jsonDecoder)
                        .mapError{ _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
