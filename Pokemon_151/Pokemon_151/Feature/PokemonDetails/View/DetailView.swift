//
//  DetailView.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 06/03/2024.
//

import SwiftUI

struct DetailView: View {
    
    var pokemonIdx: Int
    
    @StateObject private var detailsVM = DetailsViewModel(service: NetworkService())
    
    init(pokemonIdx: Int) {
        self.pokemonIdx = pokemonIdx
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.random.opacity(0.5).ignoresSafeArea()
                
                VStack {
                    if detailsVM.isRefreshing {
                        LoadingView()
                    } else {
                        if let details = detailsVM.pokemonDetails {
                            VStack(alignment: .center) {
                                DetailsHeaderView(spriteUrl: details.sprites.frontDefault)
                                Text("Pokemon:")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                Text(details.name.capitalized)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.random)
                                Text("Types:")
                                    .font(.headline)
                                Text("A) " + (details.types.first?.type.name.capitalized ?? ""))
                                    .font(.subheadline)
                                Text("B) " + (details.types.last?.type.name.capitalized ?? ""))
                                    .font(.subheadline)
                            }
                            .frame(alignment: .center)
                        }
                    }
                }
                .onAppear {
                    detailsVM.fetchPokemonDetails(for: pokemonIdx)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemonIdx: 1)
    }
}
