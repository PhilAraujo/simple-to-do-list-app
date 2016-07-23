//
//  FirstViewController.swift
//  To Do List
//
//  Created by Phil Araujo on 7/23/16.
//  Copyright © 2016 Phil Araujo. All rights reserved.
//

import UIKit

// here I am creating a global variable that represents the to do list. it must be created outside the class so it can be accessed from the second view controller as well
var toDo = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    
    
    @IBOutlet var toDoTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this chunk is used for permanent storage. use the global variable name as the objectForKey and use the if statement to let the app know whether or not the user has already added items to list that have been saved
        if NSUserDefaults.standardUserDefaults().objectForKey("toDo") != nil {
        
        // use as! [String] so the app knows that what it is saving is definitely an array of strings
        toDo = NSUserDefaults.standardUserDefaults().objectForKey("toDo") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // this will act as the number of item on the to do list
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    // this will return however many items the user has added to populate the table view
      return toDo.count
        
    }

    
    // this chunk of code will populate the items added to the list into its own cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDo[indexPath.row]
        
        return cell
        
    }
    
    // this will allow the user the ability to delete an item by swiping once they are no longer in need of it
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // this if statement will check and will be called if it detects that the user has swiped on an item to delete it
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            // this .removeAtIndex snippet will detect what item at what the row user has swiped and will delete it
            toDo.removeAtIndex(indexPath.row)
            
            // this will again update the permanent storage. this time it will have deleted the selected item that the user chose to delete
            NSUserDefaults.standardUserDefaults().setObject(toDo, forKey: "toDo")
            
            // and this will also again update the list in real time
            toDoTable.reloadData()
            
        }
    }
    
    
    // this snippet will update the app list in real time as opposed to having the list updated everytime the user closes and reopens the app. therefore the user can switch back and forth from view controllers with updated lists
    override func viewDidAppear(animated: Bool) {
        
        // use .reloadData() to update in real time
        toDoTable.reloadData()
        
    }

}

















