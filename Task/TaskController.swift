//
//  File.swift
//  Task
//
//  Created by Eva Marie Bresciano on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    let fetchedResultsController: NSFetchedResultsController
    
    static let sharedInstance = TaskController()
    
    var tasksArray: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        
    }
    
    
    let request = NSFetchRequest(entityName: "Task")
    let moc = Stack.sharedStack.managedObjectContext
    
    // return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    
    
     
    init() {
        let request = NSFetchRequest(entityName: "Task")
        let sortDescriptor1 = NSSortDescriptor(key: "isComplete", ascending: false)
        let sortDescriptor2 = NSSortDescriptor(key: "due", ascending: false)
        request.sortDescriptors = [sortDescriptor1, sortDescriptor2]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        _ = try? fetchedResultsController.performFetch()
        
    }
    
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        let _ = Task(name: name, notes: notes, due: due)
    }
    
    func removeTask(task: Task) {
        task.managedObjectContext?.deleteObject(task)
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        task.name = name
        task.notes = notes
        task.due = due
        
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("There was a problem saving to persistent storage")
            
        }
        
        
    }
    
    
}






