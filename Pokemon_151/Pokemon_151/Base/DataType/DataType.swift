//
//  DataType.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 06/03/2024.
//

import Foundation

enum DataType {
    case pokemonList(limit: Int)
    case pokemonDetail
    
    var url: URL? {
        switch self {
        case .pokemonList:
            return URL(string: ApiConstants.pokemonListUrl)
        case .pokemonDetail:
            return URL(string: ApiConstants.pokemonDetailUrl)
        }
    }
}
