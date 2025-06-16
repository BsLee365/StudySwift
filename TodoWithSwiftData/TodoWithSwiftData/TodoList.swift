//
//  Item.swift
//  TodoWithSwiftData
//
//  Created by 이범석 on 6/14/25.
//

import Foundation
import SwiftData

@Model
final class TodoList {
    
    var title: String
    var isCompleted: Bool
    var todoDesc: String
    
    init(title: String, desc: String) {
        self.title = ""
        self.isCompleted = false
        self.todoDesc = desc
    }
}
