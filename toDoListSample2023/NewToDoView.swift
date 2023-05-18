//
//  NewToDoView.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct NewToDoView: View {
    @State var title: String
    @State var isImportant: Bool//State allows us refresh the vars whenever they are changed
    
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
              
            }) {
                Text("Add")
            }
            
            .padding()
        }//end of VStack
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "TEST", isImportant: false)//sets default values for the state vars
    }
}
