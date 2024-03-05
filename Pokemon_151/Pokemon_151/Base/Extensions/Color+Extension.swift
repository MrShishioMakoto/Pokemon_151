//
//  Color+Extension.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
