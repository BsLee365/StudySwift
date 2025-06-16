//
//  Item.swift
//  SwiftDataExample
//
//  Created by 이범석 on 6/14/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
@Model
class Todo {
    var title : String
    
    init(title: String) {
        self.title = title
    }
    
}
@Model
struct extample {
    var title: String
    
    init(title: String){
        self.title = title
    }
}
