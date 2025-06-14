//
//  TodoDetail.swift
//  ToDo
//
//  Created by 이범석 on 6/13/25.
//

import SwiftUI

struct TodoDetail: View {
    
    @State var todo: Todo
    
    var body: some View {
        
        VStack {
            TextField("투두 타이틀", text: $todo.title)
                .font(.title2)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
            TextEditor(text: $todo.description)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
        }
        .padding()
        .navigationTitle("Edit Task")

    }
}

#Preview {
    TodoDetail(todo: Todo(title: ""))
}
