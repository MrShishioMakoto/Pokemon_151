//
//  PokemonListView.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject private var pokemonListVM = PokemonListViewModel(service: PokemonListService())
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Image(LocalizableKeys.Images.pokemonLogo.localizableString())
                    .padding()
                
                List {
                    if pokemonListVM.isRefreshing {
                        LoadingView()
                    } else {
                        if let pokemonsList = pokemonListVM.pokemonList?.results {
                            ForEach(pokemonsList, id: \.id) { pokemon in
                                PokemonCell(item: pokemon)
                                    .listRowSeparator(.hidden)
                            }
                        }
                    }
                }
                .onAppear(perform: pokemonListVM.fetchPokemonList)
                .padding()
                .listStyle(.inset)
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
