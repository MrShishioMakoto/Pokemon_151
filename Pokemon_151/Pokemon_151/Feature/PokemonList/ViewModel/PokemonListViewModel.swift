//
//  PokemonListViewModel.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    
    @Published private (set) var pokemonList: PokemonList?
    @Published private (set) var isRefreshing: Bool = false
    @Published var hasError: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let service: PokemonListService
    
    init(service: PokemonListService) {
        self.service = service
    }
    
    func fetchPokemonList() {
        
        isRefreshing = true
        hasError = false
        
        service.fetchData(.pokemonList(limit: 151))
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isRefreshing = false
                case .failure(let error):
                    self?.hasError = true
                    print(error)
                }
            } receiveValue: { [weak self] pokemonList in
                self?.pokemonList = pokemonList
            }.store(in: &cancellables)
    }
}
