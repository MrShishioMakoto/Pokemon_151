//
//  Pokemon_151Tests.swift
//  Pokemon_151Tests
//
//  Created by goncaloalmeida on 04/03/2024.
//

import XCTest
import Combine
@testable import Pokemon_151

final class Pokemon_151Tests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []

    func testFetchPokemonList() throws {
        let network = NetworkService()
        let expectation = XCTestExpectation(description: "Received Pokemon List")
        
        network.fetchData(.pokemonList(limit: 151))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Request failed with error: \(error)")
                }
            } receiveValue: { (value: PokemonList) -> Void in
                XCTAssertTrue(value.results.count > 0)
                XCTAssertEqual(value.results.count, 151)
                expectation.fulfill()
            }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchPokemonDetails() throws {
        let network = NetworkService()
        let expectation = XCTestExpectation(description: "Received Pokemon Details")
        
        network.fetchData(.pokemonDetails(index: 1))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Request failed with error: \(error)")
                }
            } receiveValue: { (value: Details) -> Void in
                XCTAssertEqual(value.name, "bulbasaur")
                XCTAssertEqual(value.types.first?.type.name, "grass")
                XCTAssertEqual(value.types.last?.type.name, "poison")
                expectation.fulfill()
            }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
}
