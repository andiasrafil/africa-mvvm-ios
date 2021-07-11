//
//  AnimalEndpoint.swift
//  Africa
//
//  Created by Accounting on 11/07/21.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum AnimalAPI {
    case getListAnimals
}

extension AnimalAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getListAnimals:
            return URL(string: "https://private-6516cf-andiasrafil.apiary-mock.com/")!
        }
    }
    
    var path: String {
        return "/animals"
    }
    
    
}
