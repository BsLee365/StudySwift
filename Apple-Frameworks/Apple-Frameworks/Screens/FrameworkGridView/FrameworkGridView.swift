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
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    
                    ForEach(MockData.frameworks, id: \.id)
                    { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(frameWork: viewModel.selectedFramework!,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

