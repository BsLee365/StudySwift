//
//  NetflixApp.swift
//  Netflix
//
//  Created by 이범석 on 6/18/25.
//

import SwiftUI
import SwiftData

@main
struct NetflixApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            // Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
