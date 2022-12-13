//
//  Pokedex_iOSApp.swift
//  Pokedex-iOS
//
//  Created by user on 9/12/22.
//

import SwiftUI

@main
struct Pokedex_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PokemonListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
