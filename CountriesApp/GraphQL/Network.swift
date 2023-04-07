//
//  Network.swift
//  CountriesApp
//
//  Created by Vladimir Pisarenko on 06.04.2023.
//

import Foundation
import Apollo

final class Network {
    
    static let shared = Network()
    
    private(set) var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
    private init() {}
}
