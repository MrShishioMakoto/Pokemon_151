//
//  ServiceError.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import Foundation

enum ServiceError: Error {
    case custom(error: Error)
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .custom(let error):
            return error.localizedDescription
        case .failedToDecode:
            return LocalizableKeys.ServiceError.failedToDecode.localizableString()
        case .invalidStatusCode:
            return LocalizableKeys.ServiceError.invalidStatusCode.localizableString()
        }
    }
}
