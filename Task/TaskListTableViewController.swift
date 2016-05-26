//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Eva Marie Bresciano on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasksArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskListCell", forIndexPath: indexPath)
        let task = TaskController.sharedInstance.tasksArray[indexPath.row]
        cell.textLabel?.text = task.name
        cell.updateWithTask(task: Task)
        return cell
        }
    
    // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
        let task = TaskController.sharedInstance.tasksArray[indexPath.row]
        TaskController.sharedInstance.removeTask(task)
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
          }
     }
    
    // MARK: - Actions
 
    
    
    // MARK: - Navigation
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cellToDetail"{
            let taskDVC = segue.destinationViewController as? TaskDetailTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
            let task = TaskController.sharedInstance.tasksArray[indexPath.row]
                taskDVC?.task = task
     
     }
        }
    
    }
}