//
//  MenuButtons.swift
//  MyPlayGround
//
//  Created by 이범석 on 6/8/25.
//

import SwiftUI

struct NavButtons: View {
    var body: some View {
        Button {
            print("뒤로가기 버튼")
        } label: {
            Image("before")
                .resizable()
                .frame(width: 20, height: 20)
        }
        Spacer()
        // 우측 검색메뉴 햄버거 메뉴
        HStack{
            // 검색
            Button {
                print("검색버튼")
            } label: {
                Image("search")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            // 햄버거
            Button {
            } label: {
                Image("hamburger")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
    }
}

#Preview {
    NavButtons()
}
