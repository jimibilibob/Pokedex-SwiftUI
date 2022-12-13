//
//  GraphQLConverter.swift
//  Pokedex-iOS
//
//  Created by user on 12/12/22.
//

import Foundation

class GraphQLConverter {

    static let shared = GraphQLConverter()

    func convertFromDataToPokemonStruct(data: HomePageQuery.Data, completion: @escaping(Result<[PokemonRaw], Error>) -> Void) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data.jsonObject)
            var decode: DataClass = try JSONDecoder().decode(DataClass.self, from: jsonData)
            for index in 0..<decode.species.count {
                let pokemonDetails = decode.species[index].pokemonDetails[0]
                decode.species[index].urlImage = String(format: Constants.pokemonImageURL, decode.species[index].id)
                decode.species[index].pokemonDetails[0].weaknesses = PokemonWeaknesses.shared.getPokemonWeaknessesByType(pokemonDetails.types)
            }
            completion(.success(decode.species))
        } catch {
            completion(.failure(error))
        }

    }
}
