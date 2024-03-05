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
        let urlSession = URLSession.shared
        if var url = URL(string: ApiConstants.pokemonUrl) {
            
            isRefreshing = true
            hasError = false
            
            url.append(queryItems: [URLQueryItem(name: ApiConstants.numberOfPokemons, value: "\(151)")])
            
            urlSession
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap({ res in
                    guard let response = res.response as? HTTPURLResponse,
                          response.statusCode >= 200 && response.statusCode <= 300 else {
                        throw ServiceError.invalidStatusCode
                    }
                    
                    let decoder = JSONDecoder()
                    guard let pokemonList = try? decoder.decode(PokemonList.self, from: res.data) else {
                        throw ServiceError.failedToDecode
                    }
                    return pokemonList
                })
                .sink { [weak self] res in
                    defer { self?.isRefreshing = false }
                    
                    switch res {
                    case .failure(let error):
                        self?.hasError = true
                        print(error)
                    default:
                        break
                    }
                } receiveValue: { [weak self] pokemonList in
                    self?.pokemonList = pokemonList
                }
                .store(in: &cancellables)
        }
    }
}
