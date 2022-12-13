//
//  PokemonListViewModel.swift
//  Pokedex-iOS
//
//  Created by user on 13/12/22.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemons = [PokemonRaw]()
            
    func getPokemons() {
        PokedexManager.shared.getPokemons { result in
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
            case .failure:
                print("Error")
//                self.showErrorAlert?()
//                self.loaded?()
            }
        }
    }
}
