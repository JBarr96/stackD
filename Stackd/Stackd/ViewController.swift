//
//  ViewController.swift
//  Stackd
//
//  Created by Johnathan Barr on 11/5/17.
//  Copyright © 2017 Johnathan Barr. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    var filePath = "";
    @IBOutlet var fileLabel: NSTextField!
    
    var stackScriptPath: String? {
        return Bundle.main.path(forResource: "masterscript", ofType: "sh")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func generateStack(_ sender: Any) {
        guard let scriptPath = stackScriptPath else {
            print("could not get script path")
            return
        }
        // do stuff with scriptPath
        shell("/bin/bash", scriptPath, self.filePath)
    }
    
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
    
    func shell(_ args: String...) {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        //return task.terminationStatus
    }
}

