//
//  ViewController.swift
//  Stackd
//
//  Created by Johnathan Barr, Chris Asmussen, and Chris Ragsdale on 11/5/17.
//  Copyright © 2017 Johnathan Barr. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    var filePath = "";
    //label for user to view hat path they selected
    @IBOutlet var fileLabel: NSTextField!
    
    //bundle the masterscrpit with the application
    var stackScriptPath: String? {
        return Bundle.main.path(forResource: "masterscript", ofType: "sh")
    }
    
    //default Swift functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    //function to generate stack given specified location (coupled to the Generate Stack button)
    @IBAction func generateStack(_ sender: Any) {
        //check to make sure the path to the script is valid
        guard let scriptPath = stackScriptPath else {
            print("could not get script path")
            return
        }
        // execute masterscript with the user inputted file path using Bash
        shell("/bin/bash", scriptPath, self.filePath)
    }
    
    //function to open finder browser window to select install location (coupled to the Select Location button)
    @IBAction func selectLocation(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = false
        openPanel.begin { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                self.filePath = openPanel.urls[0].path
                self.fileLabel.stringValue = "\(self.filePath)"
            }
        }
    }
    
    //function to execute Bash scripts with inputted parameters
    func shell(_ args: String...) {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        //return task.terminationStatus
    }
}

