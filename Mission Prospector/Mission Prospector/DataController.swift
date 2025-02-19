//
//  DataController.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    //let container = NSPersistentContainer(name: "Society")
    let container: NSPersistentCloudKitContainer
    init() {
        //container = NSPersistentContainer(name: "Society")
        container = NSPersistentCloudKitContainer(name: "Society")
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.loadPersistentStores { description, error in
            if let error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
