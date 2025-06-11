
//
//  ContentView.swift
//  Test3
//
//  Created by 이범석 on 6/8/25.
//

import SwiftUI

struct ContentView: View {
    
    let title: String = "끝말잇기 게임"
    
    @State var nextWord: String = ""
    @State var words: [String] = ["물컵", "컵받침", "침착맨"]
    
    @State var isShowAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold(true)
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
            //            .padding(.top, 16)
            //            .padding(.bottom, 16)
            //            .padding(.leading, 20)
            //            .padding(.trailing, 20)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.teal)
                        .opacity(0.2)
                        .shadow(radius: 5)
                )
                .padding(.top, 10)

            HStack {
                TextField("단어를 입력하세요", text: $nextWord)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2))
                    
                Button(action: {
                    // 동작
                    print(nextWord)
                    
                    // var a = words.last?.first?.lowercased()
                    // var b = nextWord.first?.lowercased()
                    
                     var a = words.last?.last
                     var b = nextWord.first

                    if a == b {
                        words.append(nextWord)
                        nextWord = ""
                        
                    }
                    else {
                        isShowAlert = true
                        nextWord = ""
                    }
                    
                }, label: {
                    Text("확인")
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .font(.headline)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                        .foregroundStyle(.white)
                })
                .alert("끝말이 이어지는 단어를 입력해주세요", isPresented: $isShowAlert) {
                    
                    Button("확인" , role: .destructive) {
                        isShowAlert = false
                    }
                }
            }
            .padding(.top, 20)
            
            List {
                ForEach(words.reversed(), id: \.self) { word in
                    Text(word)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            Spacer()
            
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ContentView()
}
