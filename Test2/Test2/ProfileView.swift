//
//  ProfileView.swift
//  Test2
//
//  Created by 이범석 on 6/7/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        // 상단
        HStack{
            VStack{
                Image("dogProfile")
                    .resizable()
                    .frame(width:120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.teal, lineWidth: 3))
            }
            VStack(alignment: .leading) {
                Text("이름 : 이리수")
                Text("별명 : 돼지")
                Text("1999년 09월 16일생")
            }
            .font(.system(size: 20))
            .padding(.leading, 20)
            // .border(Color.gray, width: 1)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    ProfileView()
}
