//
//  CoreDataStack.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import Foundation
import CoreData

final class CoreDataStack{
    
    static let instance = CoreDataStack()
    
    var viewContext: NSManagedObjectContext {
        return CoreDataStack.instance.persistentContainer.viewContext
      }
    
    private lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "RickyAndMortyCd")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
}
