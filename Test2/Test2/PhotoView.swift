//
//  PhotoView.swift
//  Test2
//
//  Created by 이범석 on 6/7/25.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        // 하단
        ScrollView(.horizontal) {
            HStack{
                
                DogImageView(imageName: "dog1", colorName: .red)
                DogImageView(imageName: "dog2", colorName: .green)
                DogImageView(imageName: "dog3", colorName: .blue)
                
            }.padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow)
                    .opacity(0.2)
                    .shadow(radius: 5))
        }.scrollIndicators(.hidden)
    }
}

struct DogImageView: View {
    
    var imageName: String
    var colorName: Color
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 160, height: 160, alignment : .center)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(colorName, lineWidth: 3))
    }
}

#Preview {
    PhotoView()
}
