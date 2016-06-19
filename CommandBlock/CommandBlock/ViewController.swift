//
//  ViewController.swift
//  CommandBlock
//
//  Created by Luca on 6/19/16.
//  Copyright © 2016 Space!, Ink. All rights reserved.
//

import Cocoa

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
    
    

    @IBAction func commandAction(sender: AnyObject) {
        
    }
    
}

