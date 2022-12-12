//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
