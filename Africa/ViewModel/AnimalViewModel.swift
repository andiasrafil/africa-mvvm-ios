//
//  AnimalViewModel.swift
//  Africa
//
//  Created by Accounting on 11/07/21.
//

import Foundation
import Combine

protocol AnimalViewModel {
    func getAnimals()
}

class AnimalViewModelImpl: ObservableObject, AnimalViewModel {
    
    private let service: AnimalService
    private(set) var animals = Animals()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: AnimalService) {
        self.service = service
    }
    func getAnimals() {
        self.state = .loading
        let cancellable = service
            .request(from: .getListAnimals)
            .sink(receiveCompletion: { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.animals)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            }, receiveValue: { response in
                self.animals = response
            })
        
        self.cancellables.insert(cancellable)
            
    }
}
