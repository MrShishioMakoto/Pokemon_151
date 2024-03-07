//
//  PokemonListView.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import SwiftUI
import Foundation

struct PokemonListView: View {
    
    @StateObject private var pokemonListVM = PokemonListViewModel(service: NetworkService())
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.opacity(0.5).ignoresSafeArea()
                
                VStack {
                    Image(LocalizableKeys.Images.pokemonLogo.localizableString())
                        .padding()
                    
                    List {
                        if pokemonListVM.isRefreshing {
                            LoadingView()
                        } else {
                            if let pokemonsList = pokemonListVM.pokemonList?.results {
                                ForEach(0..<pokemonsList.count, id: \.self) { index in
                                    NavigationLink(destination: DetailView(pokemonIdx: index + 1)) {
                                        PokemonCell(item: pokemonsList[index])    
                                    }
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.yellow.opacity(0.5))
                            }
                        }
                    }
                    .onAppear(perform: pokemonListVM.fetchPokemonList)
                    .listStyle(.inset)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color.green, lineWidth: 8)
                    )
                    .padding()
                }
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
