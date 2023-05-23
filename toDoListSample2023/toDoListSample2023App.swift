//
//  toDoListSample2023App.swift
//  toDoListSample2023
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

@main
struct toDoListSample2023App: App {
    let persistenceController = PersistenceController.shared//allows project to access core data
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
