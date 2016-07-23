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
        // Do any additional setup after loading the view, typically from a nib.
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
    
    // this snippet will update the app list in real time as opposed to having the list updated everytime the user closes and reopens the app. therefore the user can switch back and forth from view controllers with updated lists
    override func viewDidAppear(animated: Bool) {
        
        // use .reloadData() to update in real time
        toDoTable.reloadData()
        
    }


}

