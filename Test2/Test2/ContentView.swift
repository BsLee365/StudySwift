//
//  ContentView.swift
//  Test2
//
//  Created by 이범석 on 6/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            ProfileView()
            LikesView()
            SkillsView()
            PhotoView()
        }.padding()
    }
}

#Preview {
    ContentView()
}
   
