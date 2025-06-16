//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by 이범석 on 6/14/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    // @Query private var items: [Item]
    @Query private var todoList: [Todo]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todoList) { todo in
                    NavigationLink {
                        Text("다음화면 입니다")
                    } label: {
                        Text(todo.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
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
            // let newItem = Item(timestamp: Date())
            // modelContext.insert(newItem)
            
            let newTodo = Todo(title: "새로운 항목")
            modelContext.insert(newTodo)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoList[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
