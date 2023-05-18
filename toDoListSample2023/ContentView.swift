//
//  ContentView.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack {
            HStack{
                Text("List of things")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                Spacer()
                
                Button(action: {
                                    
                }) {
                Text("+")
                }
                Spacer()
            }//end of Hstack
            .padding()
        }//end of Vstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
