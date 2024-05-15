//
//  weatherAppApp.swift
//  weatherApp
//
//  Created by manan jain on 15/05/24.
//

import SwiftUI

@main
struct weatherAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
