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
    
    static let sharedInstance = TaskController()
    
    
    
    var tasksArray: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        

    }
    
    func fetchTasks() -> [Task] {
        
        return mockTasks
    }
    
    var mockTasks:[Task] {
        if let task1 = Task(name: "Eat berries", notes: "all colors", due: nil),
            task2 = Task(name: "Play badminton", notes: "win.", due: NSDate()),
            task3 = Task(name: "Feed Pippin", notes: "Pellets, apple, clover", due: nil) {
            return [task1, task2, task3]
        } else {
            return []
        }
        
        }
    
    let request = NSFetchRequest(entityName: "Task")
    let moc = Stack.sharedStack.managedObjectContext
    
    // return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    
    
    
    var completedTask: [Task] {
        return tasksArray.filter{$0.isComplete.boolValue}
    }
    
    var incompleteTask: [Task] {
        return tasksArray.filter{!$0.isComplete.boolValue}
        
    }
    
    init() {
        
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






