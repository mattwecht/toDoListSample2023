//
//  NewToDoView.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var title: String
    @State var isImportant: Bool//State allows us refresh the vars whenever they are changed
    //@Binding var toDoItems: [ToDoItem]//two way connection between ContentView and newToDoView
    @Binding var showNewTask : Bool//connects to button flag from content view
    
    
    var body: some View {
        VStack{
            Text("Add New Thingy")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter that thang here", text: $title)
                .padding()
            .background(Color(.systemGroupedBackground))
            .cornerRadius(15)
              .padding()
            
            Toggle(isOn: $isImportant) {
                            Text("Do you care about this?")
                        }
            
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)//calls our custom function
                
                self.showNewTask = false//hide the add section
              
            }) {
                Text("Add")
            }
            
            .padding()
        }//end of VStack
    }

    private func addTask(title: String, isImportant: Bool = false) {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
        /*
            
            let task = ToDoItem(title: title, isImportant: isImportant)
            toDoItems.append(task)*/
        }//function that creates the tasks
    
}//end of struct

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "TEST", isImportant: false,showNewTask: .constant(true))//sets default values for the state vars/binding vars
    }
}
