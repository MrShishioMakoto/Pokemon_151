//
//  DetailsHeaderView.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 06/03/2024.
//

import SwiftUI
import Kingfisher

struct DetailsHeaderView: View {
    
    var spriteUrl: String
    
    var body: some View {
        ZStack {
            KFImage(URL(string: spriteUrl))
                .resizable()
                .scaledToFit()
        }
        .frame(width: 200, height: 200)
    }
}

struct DetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHeaderView(spriteUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg")
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
