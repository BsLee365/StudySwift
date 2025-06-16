//
//  TodoWithSwiftDataApp.swift
//  TodoWithSwiftData
//
//  Created by 이범석 on 6/14/25.
//

import SwiftUI
import SwiftData

@main
struct TodoWithSwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TodoList.self,
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
