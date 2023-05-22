//
//  ContentView.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var toDoItems: [ToDoItem] = []//empty array of the object we made
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
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }//displays !! for important tasks. Notice website had error with a nested if. Delete second IF
                
            }//end of list
        }//end of Vstack
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: $toDoItems,showNewTask: $showNewTask)
                }//transitions once the button is clicked
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
