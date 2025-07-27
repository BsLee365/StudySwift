//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by 이범석 on 7/24/25.
//

import SwiftUI

struct AFButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    AFButton(title: "Test title")
}
