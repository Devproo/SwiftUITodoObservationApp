//
//  TodoItem.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 05/01/2024.
//

import Foundation
import Observation

@Observable
class Item: Identifiable {
    var id = UUID()
    var  title: String
    var isCompleted: Bool
    var dueDate: Date
    
    init(title: String, isCompleted: Bool, dueDate: Date) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }
}
