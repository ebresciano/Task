//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Eva Marie Bresciano on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var notesTextField: UITextField!
    
    @IBOutlet weak var dueTextField: UITextField!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        updateTask()
        navigationController?.popViewControllerAnimated(true)
    }
    
    func updateWithTask(task: Task) {
        
        
        
        
    }
    
    func updateTask() {
        
        guard let name = nameTextField.text else {return}
        let due = NSDate()
        let notes = notesTextField.text
        
        if let task = self.task {
            TaskController.sharedInstance.updateTask(task, name: name, notes: notes, due: due, isComplete: false)
        } else {
            TaskController.sharedInstance.addTask(name, notes: notes, due: due)
        }
    }
    
}
