//
//  ContentView.swift
//  ToDo
//
//  Created by 이범석 on 6/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoList: [Todo] = [
        Todo(title: "친구 만나기"),
        Todo(title: "운동하기"),
        Todo(title: "로또 당첨되기")
    ]
    
    // 추가
    func addTodo() {
        withAnimation{
            print("플러스 버튼이 눌렸어요.")
            todoList.append(Todo(title: "투두 추가"))
        }
    }
    
    // 삭제
    func deleteTodo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
                todoList.remove(at: index)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoList) { todo in
                    HStack {
                        
                        var flag = todo.isCompleted ? "circle.fill" : "circle"
                        Image(systemName: flag)
                            .foregroundStyle(Color.pink)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        
                        NavigationLink {
                            // 다음화면의 뷰
                            Text(todo.description)
                        } label: {
                            // 버튼이 어떻게 생길지
                            var cFlag = todo.isCompleted ? Color.gray : Color.primary
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: Color.gray)
                                .foregroundStyle(cFlag)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteTodo)
            }
            .listStyle(.plain)
            .navigationTitle("Todo List")
            .toolbar{
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTodo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
