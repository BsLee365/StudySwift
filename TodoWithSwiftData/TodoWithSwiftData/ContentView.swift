//
//  ContentView.swift
//  TodoWithSwiftData
//
//  Created by 이범석 on 6/14/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    // @Environment(\.editMode) private var editMode
    
    @Query private var todoList: [TodoList]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todoList) { todo in
                    HStack{
                        let flag = todo.isCompleted ? "circle.fill" : "circle"
                        Image(systemName: flag)
                            .foregroundStyle(Color.red)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        NavigationLink {
                            TodoDetail(
                                todo: .constant(
                                    TodoList(title: "", desc: "")
                                )
                            )
                        } label: {
                            let cFlag = todo.isCompleted ? Color.gray : Color.primary
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: Color.gray)
                                .foregroundStyle(cFlag)
                        }
                    }
                }
                // 딜리트 누르면 실행되는 함수 넣기
                .onDelete(perform: deleteItems)
            }
            .listStyle(.plain)
            .navigationTitle("할 일 작성해보기.")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // swift ui 내장 편집버튼
                    EditButton()
                    /*
                    Button(action: toggleEdit) {
                        Text(editMode?.wrappedValue == .active ? "완료" : "편집")
                    }
                    */
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = TodoList(title: "", desc: "")
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoList[index])
            }
        }
    }
    
    /*
    private func toggleEdit() {
        withAnimation {
            if(editMode?.wrappedValue == .active) {
                editMode?.wrappedValue = .inactive
            }
            else {
                editMode?.wrappedValue = .active
            }
        }
    }
    */
}

#Preview {
    ContentView()
        .modelContainer(for: TodoList.self, inMemory: true)
}
