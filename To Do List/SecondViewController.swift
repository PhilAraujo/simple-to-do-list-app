//
//  SecondViewController.swift
//  To Do List
//
//  Created by Phil Araujo on 7/23/16.
//  Copyright © 2016 Phil Araujo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet var itemTextField: UITextField!
    
    
    
    @IBAction func addItemButton(sender: AnyObject) {
        // this snippet of code will add what the user enters into the text field to the array of strings that was defined outside the class in the first view controller
        toDo.append(itemTextField.text!)
        
        // this will clear itemTextField.text which will let the user add another item to the list
        itemTextField.text = ""
        
        // this will update NSUserDefaults with the array the user entered, storing it permanently. set the .setObject and forKey as toDo since we want to store the toDo list items permanently
        NSUserDefaults.standardUserDefaults().setObject(toDo, forKey: "toDo")
        
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // this snippet will allow the user to close the keyboard if they tap anywhere else on the screen that isn't the text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    
    
    // use textFieldShouldReturn and resignFirst Responder() to let the user tap the return button to close the keyboard. Returning this as true will allow it to happen
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        itemTextField.resignFirstResponder()
        return true
        
    }

}

