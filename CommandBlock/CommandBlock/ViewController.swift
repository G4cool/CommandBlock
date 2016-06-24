//
//  ViewController.swift
//  CommandBlock
//
//  Created by Luca on 6/19/16.
//  Copyright © 2016 Space!, Ink. All rights reserved.
//

//#!/usr/bin/env swift

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
        
        var task:NSTask = NSTask()
        var pipe:NSPipe = NSPipe()
        
        task.launchPath = "/bin/ls"
        task.arguments = [commandField.stringValue]
        task.standardOutput = pipe
        task.launch()
        
        var handle = pipe.fileHandleForReading
        var data = handle.readDataToEndOfFile()
        var result_s = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(result_s)
    }
    
}

