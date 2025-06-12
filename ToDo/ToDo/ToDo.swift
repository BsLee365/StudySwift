//
//  ToDo.swift
//  ToDo
//
//  Created by 이범석 on 6/12/25.
//
import Foundation

@Observable
class Todo: Identifiable {
    // identify
    let id: UUID
    var title: String
    var isCompleted: Bool
    var description: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
        self.description = ""
    }
}
