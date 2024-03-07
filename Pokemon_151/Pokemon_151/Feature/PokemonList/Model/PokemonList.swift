//
//  Anime.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import Foundation

struct PokemonList: Decodable {
    let results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Pokemon: Decodable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}

extension PokemonList {
    static let dummyData = Pokemon(name: "Pikachu", url: "https://pika")
}

