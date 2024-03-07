//
//  Details.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 06/03/2024.
//

import Foundation

struct Details: Decodable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, sprites, types
    }
}

struct Sprites: Decodable {
    let frontDefault: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct TypeElement: Decodable {
    let type: PokemonClass
    
    private enum CodingKeys: String, CodingKey {
        case type
    }
}

struct PokemonClass: Codable {
    let name: String
}

extension Details {
    static let dummyData = Details(id: 11, name: "Pikachu", sprites: Sprites(frontDefault: ""), types: [TypeElement(type: PokemonClass(name: "Fight"))])
}
