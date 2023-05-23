//
//  ContentView.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context//allows for delete
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    
    
    //@State var toDoItems: [ToDoItem] = []//empty array of the object we made
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        //change ascending to true to sort by alphabet
    var toDoItems: FetchedResults<ToDo>
    
    @State private var showNewTask = false//flag for the plus button

    
    
    var body: some View {

        VStack {
            HStack{
                Text("List of things")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                Spacer()
                
                Button(action: {
                    self.showNewTask = true
                }) {
                Text("+")
                }
                Spacer()
            }//end of Hstack
            .padding()
            List {
                
                ForEach (toDoItems) {
                    toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + (toDoItem.title ?? "No title"))
                    } else {
                        Text(toDoItem.title ?? "No title")
                    }
                    /*if toDoItem.isImportant == true {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }*/ //THIS IS HOW TO DO WITHOUT CORE DATA
                    
                }
                .onDelete(perform: deleteTask)
                //displays !! for important tasks. Notice website had error with a nested if. Delete second IF
                
            }//end of list
        }//end of Vstack
        
       /* if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: $toDoItems,showNewTask: $showNewTask)
            
                }*/ //transitions once the button is clicked
        if showNewTask {
            NewToDoView(title: "", isImportant: false, showNewTask: $showNewTask)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
