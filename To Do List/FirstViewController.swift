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

class FirstViewController: UIViewController {
    
    
    @IBOutlet var toDoTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

