//
//  ViewController.swift
//  CommandBlock
//
//  Created by Luca on 6/19/16.
//  Copyright © 2016 Space!, Ink. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {

    @IBOutlet weak var commandField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func shell(args: String...) -> Int32 {
        let task = NSTask()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }

    @IBAction func commandAction(sender: AnyObject) {
        //shell(commandField.stringValue)
        // Create a Task instance
        let task = NSTask()
        
        // Set the task parameters
        //task.launchPath = "/usr/bin/env"
        task.launchPath = "/Users/Luca"
        task.arguments = [commandField.stringValue]
        
        // Create a Pipe and make the task
        // put all the output there
        let pipe = NSPipe()
        task.standardOutput = pipe
        
        // Launch the task
        task.launch()
        
        // Get the data
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        print(output!)
    }
    
}

