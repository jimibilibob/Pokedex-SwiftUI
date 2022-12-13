//
//  NetworkManager.swift
//  Pokedex-iOS
//
//  Created by user on 12/12/22.
//

import Foundation
import Apollo

class NetworkManager {
    static let shared = NetworkManager()

    lazy var apollo = ApolloClient(url: URL(string: Constants.pokeApiEndpoint)!)
}
