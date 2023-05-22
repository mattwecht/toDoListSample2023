//
//  ToDoItem.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import Foundation
class ToDoItem: Identifiable {//inherits from Identifiable
    
    var id = UUID()// creates a unique identifier for each instance 
    var title : String
    var isImportant : Bool
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
        }
}
