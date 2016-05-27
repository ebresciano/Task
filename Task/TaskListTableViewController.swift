//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Eva Marie Bresciano on 5/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let sections = TaskController.sharedInstance.fetchedResultsController.sections else {
            return 0 }
        return sections.count
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = TaskController.sharedInstance.fetchedResultsController.sections else
        {return 0}
        return sections[section].numberOfObjects
    }

   
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ButtonTableViewCell", forIndexPath: indexPath)
        guard let task = TaskController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? Task else { return UITableViewCell()}
        cell.textLabel?.text = task.name

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = TaskController.sharedInstance.fetchedResultsController.sections,
            index = Int(sections[section].name) else {return nil}
        if index == 0 {
            return "isComplete"}
        else { return "Complete"}
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            guard let task = TaskController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? Task else {return}
            TaskController.sharedInstance.removeTask(task)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "cellToDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let destinationVC = segue.destinationViewController as? TaskDetailTableViewController
            let task = TaskController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? Task
            destinationVC?.task = task
        }
    }

}
