//
//  ContentView.swift
//  Netflix
//
//  Created by 이범석 on 6/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .toolbarBackground(.black, for: .tabBar)
            Text("2탭 화면")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            Text("3탭 화면")
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Game")
                }
            Text("4탭 화면")
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Game")
                }
                
            
        }
    }
}

#Preview {
    ContentView()
}
