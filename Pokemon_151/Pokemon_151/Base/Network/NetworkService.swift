//
//  NetworkService.swift
//  Pokemon_151
//
//  Created by goncaloalmeida on 04/03/2024.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>() -> AnyPublisher<T, ServiceError>
}

final class NetworkService {
    
    func fetchData<T: Decodable>(_ dataType: DataType) -> AnyPublisher<T, ServiceError> {
        
        guard var url = dataType.url else {
            return Fail(error: ServiceError.generic).eraseToAnyPublisher()
        }
        
        switch dataType {
        case .pokemonList(let limit):
            url.append(queryItems: [URLQueryItem(name: ApiConstants.numberOfPokemons, value: "\(limit)")])
        case .pokemonDetails(let index):
            url = url.appendingPathComponent("\(index)", conformingTo: .url)
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 && httpResponse.statusCode <= 300 else {
                    throw ServiceError.invalidStatusCode
                }
                
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .mapError({ error -> ServiceError in
                return .custom(error: error)
            })
            .eraseToAnyPublisher()
    }
}
