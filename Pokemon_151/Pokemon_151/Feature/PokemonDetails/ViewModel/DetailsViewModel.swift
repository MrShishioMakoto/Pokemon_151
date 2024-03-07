//
//  DetailsViewModel.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 06/03/2024.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
    
    @Published private (set) var pokemonDetails: Details?
    @Published private (set) var isRefreshing: Bool = false
    @Published var hasError: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func fetchPokemonDetails(for index: Int) {
        
        isRefreshing = true
        hasError = false
        
        service.fetchData(.pokemonDetails(index: index))
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isRefreshing = false
                case .failure(let error):
                    self?.hasError = true
                    print(error)
                }
            } receiveValue: { details in
                self.pokemonDetails = details
            }.store(in: &cancellables)
    }
}
