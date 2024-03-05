//
//  PokemonListService.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import Foundation

protocol PokemonListServiceProtocol {
    func fetchPokemonList() async throws -> PokemonList
}

final class PokemonListService {
    
    func fetchPokemonList() async throws -> PokemonList {
        let urlSession = URLSession.shared
        let url = URL(string: ApiConstants.pokemonUrl)
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode(PokemonList.self, from: data)
    }
}
