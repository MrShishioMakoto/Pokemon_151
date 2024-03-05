//
//  String+Extension.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 05/03/2024.
//

import Foundation

extension String {
    
    func localizableString() -> String {
        NSLocalizedString(self, comment: "")
    }
}
