//
//  Mission_ProspectorApp.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import SwiftUI

@main
struct Mission_ProspectorApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
