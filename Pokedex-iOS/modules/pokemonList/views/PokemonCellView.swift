//
//  PokemonCellView.swift
//  Pokedex-iOS
//
//  Created by user on 11/12/22.
//

import SwiftUI

struct PokemonCellView: View {

    var pokemon: PokemonRaw

    var body: some View {
        ZStack {
            ZStack {
                HStack(alignment: .top, spacing: 0) {
                    Spacer()
                    VStack {
                        Image("Pattern-cell")
                            .offset(x: 0, y: -6)
                    }
                    Spacer()
                    Image("Pokeball-cell")
                        .resizable()
                        .offset(x: 0, y: -12)
                        .frame(width: 145, height: 120, alignment: .center)
                }
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(pokemon.getPokemonIndexString())")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        Text(pokemon.name.capitalized)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text(pokemon.getTypesString())
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            }
            .background(Color(hex: PokemonColors.pokemonTypeColorMap[pokemon.pokemonDetails[0].types[0].type.name] ?? "normal"))
            .cornerRadius(15)
            HStack {
                Spacer()
                AsyncImage(url: URL(string: pokemon.urlImage)) { image in
                    image
                        .resizable()
                        .offset(x: 0, y: -20)
                        .frame(width: 150, height: 150, alignment: .trailing)
                        .padding(.trailing, 10)
                } placeholder: {
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(.gray, lineWidth: 5)
                        .rotationEffect(Angle(degrees: 360))
                        .animation(Animation.default.repeatForever(autoreverses: false))
                        .frame(width: 50, height: 50, alignment: .trailing)
                        .padding(.trailing, 10)
                }
            }
        }
        .listRowSeparator(.hidden)
        .buttonStyle(PlainButtonStyle())
        .listRowBackground(Color.clear)
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        PokemonCellView(pokemon: PokemonRaw(id: 1, name: "some",
//                                            generation: Generation(id: 4, name: "gen1"),
//                                            pokemonDetails: [PokemonDetail(name: "detail1", height: 5, weight: 5,
//                                                                           types: [TypeElement(type: Generation(id: 3, name: "gen1"))], stats: [])]))
    }
}
