//
//  FifthVC.swift
//  HW 6 Persistence
//
//  Created by Jay Shah on 3/25/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class FifthVC: UIViewController {

    @IBOutlet weak var userInput: UITextView!
    var input: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getURL(documentName: String) -> NSURL {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let directory = urls.first!
        
        return directory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }
    
    func saveToPList() {
        if let userText = userInput.text {
            input = userText.characters.split{$0 == " "}.map(String.init)
        }
        let saveArray = input as NSArray
        saveArray.writeToURL(getURL("input"), atomically: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showVC6") {
            saveToPList()
        }
    }

}
