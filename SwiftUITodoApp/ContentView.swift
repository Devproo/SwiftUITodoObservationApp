//
//  ContentView.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 05/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var newToDoTitle = ""
    @State  var items: [Item] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add new toDo", text: $newToDoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    addItem(title: newToDoTitle)
                    newToDoTitle = ""
                }, label: {
                    Text("Add")
                })
            }
            .padding()
            
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        
                        if item.isCompleted {
                            Image(systemName: "checkmark.fill.circle")
                        }
                    }
                    .onTapGesture {
                        toggleCompleted(for: item)
                    }
                }
                .onDelete(perform: deleteItem )
            }
        }
    }
    
    func addItem(title: String) {
        let newItem = Item(title: title, isCompleted: false, dueDate: Date())
        items.append(newItem)
    }
    
    func toggleCompleted(for item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    func deleteItem(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
}

#Preview {
    ContentView()
}
