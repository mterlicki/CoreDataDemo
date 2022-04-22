//
//  CoreDataStore.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 22/04/2022.
//

import Foundation
import CoreData

enum StorageType {
  case persistent, inMemory
}

class CoreDataStore {
  let persistentContainer: NSPersistentContainer

  init(_ storageType: StorageType = .persistent) {
    self.persistentContainer = NSPersistentContainer(name: "CoreDataDemo")

    if storageType == .inMemory {
      let description = NSPersistentStoreDescription()
      description.url = URL(fileURLWithPath: "/dev/null")
      self.persistentContainer.persistentStoreDescriptions = [description]
    }

    self.persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
  }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
