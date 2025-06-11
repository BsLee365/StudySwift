//
//  NavTitle.swift
//  MyPlayGround
//
//  Created by 이범석 on 6/8/25.
//

import SwiftUI

struct NavTitle: View {
    var body: some View {
        HStack {
            Text("회사 단톡방 모임")
                .bold()
                .font(.system(size: 20))
            Text("24")
                .bold()
                .font(.system(size: 20))
                .opacity(0.5)
        }
    }
}

#Preview {
    NavTitle()
}
