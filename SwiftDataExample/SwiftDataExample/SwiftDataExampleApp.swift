//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by 이범석 on 6/14/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    var sharedModelContainer: ModelContainer = {
        
        // 사용할 스키마
        let schema = Schema([
            // Item.self,
            Todo.self,
        ])
        
        // 저장소를 설정하는 단계
        // is StoredInMemoryOnly = true 이면, 휘발성 데이터
        // 나중에 저장 경로도 따로 설정할 수 있음
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        // 컨테이너 생성
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
