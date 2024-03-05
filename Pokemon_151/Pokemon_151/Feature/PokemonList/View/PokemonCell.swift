//
//  PokemonCell.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import SwiftUI

struct PokemonCell: View {
    
    let item: Pokemon
    
    var body: some View {
        Text(item.name.uppercased())
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(item: PokemonList.dummyData)
    }
}
