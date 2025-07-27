//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by 이범석 on 7/22/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        // TODO NavigationStack으로 변경
        NavigationView {
            List {
                
                ForEach(MockData.frameworks, id: \.id)
                { framework in
                    
                    NavigationLink(destination: FrameworkDetailView(frameWork: framework, isShowingDetailView: $viewModel.isShowingDetailView)) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
    
}

#Preview {
    FrameworkGridView()
}

