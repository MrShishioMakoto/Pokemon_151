//
//  LoadingView.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
