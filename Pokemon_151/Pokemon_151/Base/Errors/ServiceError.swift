//
//  ServiceError.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import Foundation

enum ServiceError: Error {
    case generic
    case custom(error: Error)
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .generic:
            return LocalizableKeys.ServiceError.generic.localizableString()
        case .custom(let error):
            return error.localizedDescription
        case .invalidStatusCode:
            return LocalizableKeys.ServiceError.invalidStatusCode.localizableString()
        }
    }
}
