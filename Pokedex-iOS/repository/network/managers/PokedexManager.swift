//
//  PokedexManager.swift
//  Pokedex-iOS
//
//  Created by user on 12/12/22.
//

import Foundation
import Apollo

class PokedexManager {

    static let shared = PokedexManager()

    func getPokemons(completion: @escaping (Result<[PokemonRaw], Error>) -> Void) {
        NetworkManager.shared.apollo.fetch(query: HomePageQuery()) { data in
            switch data {
            case .success(let graphResult):
                GraphQLConverter.shared.convertFromDataToPokemonStruct(data: graphResult.data!) { data in
                    switch data {
                    case.success(let species):
                        DispatchQueue.main.async {
                            completion(.success(species))
                        }
                    case.failure(let error):
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

    }

}
