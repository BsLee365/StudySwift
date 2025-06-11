//
//  ContentView.swift
//  MyPlayGround
//
//  Created by 이범석 on 6/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var typing: String = ""
    @State var chats: [String] = []
    
    var body: some View {
        
        
        VStack {
            NavBar()
            
            ScrollView {
//                ForEach(chats, id: Identifiable) { chat in
//                    Text(chat)
//                }
            }

        }
        .background(Color(hex: "#9EB6C8"))
        
        HStack {
            Button {
                print("plus")

            } label: {
                Image("plus")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .opacity(0.5)
            }
            
            HStack {
                TextField("메시지 입력", text: $typing)
                
                if typing.isEmpty {
                    Button {
                        print("이모티콘 눌림")
                    } label: {
                        Image("smile")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .opacity(0.5)
                    }
                    .padding(.trailing, 10)
                    
                    Button {
                        print("")
                    } label: {
                        Text("#")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.black)
                            .opacity(0.5)
                    }
                }
                else {
                    Button {
                        

                    } label: {
                        Image("send")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }

                }
            }
            .frame(width: 300, height: 15)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "#e5e5e5"), style: StrokeStyle(lineWidth: 1))
            )
            
        }.background(.white)
            .padding(.bottom, 10)
        

    }
}

#Preview {
    ContentView()
}
