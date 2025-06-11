//
//  NavBar.swift
//  MyPlayGround
//
//  Created by 이범석 on 6/8/25.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        ZStack {
            HStack{
                Spacer()
                // 채팅방 이름
                NavTitle()
                Spacer()
            }
            HStack {
                NavButtons().padding(.horizontal, 20)
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    NavBar()
}
