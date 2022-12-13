//
//  PokemonListView.swift
//  Pokedex-iOS
//
//  Created by user on 9/12/22.
//

import SwiftUI

struct PokemonListView: View {

    @StateObject private var viewModel = PokemonListViewModel()

    @State private var searchText = ""
    @State private var showCancelButton: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image("Pokeball-home")
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Pokédex")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Search for Pokémon by name or using the National Pokédex Number")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                }
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("What Pokémon are you looking for?", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                
                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal, 20)
                .navigationBarHidden(showCancelButton)
                .offset(x: 0, y: -50)
                List(viewModel.pokemons, id: \.id) { pokemon in
                    PokemonCellView(pokemon: pokemon)
                        .overlay(
                            NavigationLink(destination: ContentView(), label: {
                            EmptyView()
                        })
                            .opacity(0))
                }
                .listStyle(PlainListStyle())
                .onAppear() {
                    UITableView.appearance().backgroundColor = .clear
                }
                .offset(x: 0, y: -50)
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.getPokemons()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
