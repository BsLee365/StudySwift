//
//  SkillsView.swift
//  Test2
//
//  Created by 이범석 on 6/7/25.
//

import SwiftUI

struct SkillsView: View {
    var body: some View {
        // 중단2
        VStack(alignment: .leading, spacing: 10) {
            
            Text("스킬").font(.system(size: 20)).bold()
            Divider()
            
            HStack(alignment: .top, spacing: 30){
                VStack(alignment: .leading ,spacing: 10){
                    Text("- 앉아")
                    Text("- 엎드려(안자와 자주 혼동함)")
                    Text("- 하우스(집으로 들어가기")
                }
                VStack(spacing: 10) {
                    Text("- 손")
                    Text("- 코")
                }
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.red)
            .opacity(0.2)
            .shadow(radius: 5))
    }
}

#Preview {
    SkillsView()
}
