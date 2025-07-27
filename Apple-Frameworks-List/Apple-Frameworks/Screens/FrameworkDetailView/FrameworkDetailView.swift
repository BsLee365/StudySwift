//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by 이범석 on 7/24/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var frameWork: Framework
    
    @Binding var isShowingDetailView: Bool
    
    @State private var isShowingSafariView: Bool = false // FrameworkDetailView에서만 동작을 하기 때문에, @State로 작성해줌
    
    var body: some View {
        
        
        VStack {
            FrameworkTitleView(framework: frameWork)
            Text(frameWork.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            }  label : {
                // AFButton(title: "더 알아보기")
                Label("더 알아보기", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .foregroundColor(.white)
            .buttonBorderShape(.roundedRectangle(radius: 230))
            .tint(.red)
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView,
               content: {
            SafariView(url: URL(string: frameWork.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(frameWork: MockData.sampleFramework, isShowingDetailView: .constant(false))
}
