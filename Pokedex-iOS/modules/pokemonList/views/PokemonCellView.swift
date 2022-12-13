//
//  PokemonCellView.swift
//  Pokedex-iOS
//
//  Created by user on 11/12/22.
//

import SwiftUI

struct PokemonCellView: View {
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
                        Text("#001")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        Text("Bulbasaur")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text("Grass, Poisson")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            }
            .background(.red)
            .cornerRadius(15)
            HStack {
                Spacer()
                Image("Ivysaur")
                    .resizable()
                    .offset(x: 0, y: -20)
                    .frame(width: 150, height: 150, alignment: .trailing)
                    .padding(.trailing, 10)
            }
        }
        .listRowSeparator(.hidden)
        .buttonStyle(PlainButtonStyle())
        .listRowBackground(Color.clear)
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView()
    }
}
