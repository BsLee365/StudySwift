//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by 이범석 on 7/26/25.
//

import SwiftUI

struct FrameworkTitleView: View {
    
    let framework: Framework

    var body : some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.trailing, 20)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
