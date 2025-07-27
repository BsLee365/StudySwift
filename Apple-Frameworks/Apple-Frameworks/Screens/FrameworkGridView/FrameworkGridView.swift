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
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                     
                    ForEach(MockData.frameworks, id: \.id)
                    { framework in
                        // Stack에 추가하는 역할
                        NavigationLink(value: framework) {
                            // 해당 view로 이동
                            FrameworkTitleView(framework: framework)
                        }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            // 목적지를 설정하는 역할
            .navigationDestination(for: Framework.self) { framework in
                FrameworkDetailView(frameWork: framework)
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

