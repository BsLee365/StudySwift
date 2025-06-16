//
//  TodoDetail.swift
//  TodoWithSwiftData
//
//  Created by 이범석 on 6/14/25.
//

import SwiftUI

struct TodoDetail: View {
    
    @Binding var todo: TodoList
    
    @Environment(\.modelContext) private var modelContext
    
    // @State var title: String = "제목"
    // @State var content: String = "설명"
    
    var body: some View {
        VStack {
            // placeHolder 작성
            
            TextField("할 일을 입력하세요", text: $todo.title)
                .font(.title2)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                )
        
            TextEditor(text: $todo.todoDesc)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                )
                
        }
        .padding()
        .navigationTitle("할 일을 작성하세요.")
        .toolbar{
            ToolbarItem{
                Button("저장") {
                    do {
                      try modelContext.save()
                    }
                    catch {
                        print("Error Context Save: \(error)")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    TodoDetail(
        todo: .constant(
            TodoList(title: "", desc: "")
        )
    )
}
