//
//  ThirdVC.swift
//  HW 6 Persistence
//
//  Created by Jay Shah on 3/25/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    @IBOutlet weak var inputText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getURL(documentName: String) -> NSURL {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let directory = urls.first
        
        return (directory?.URLByAppendingPathComponent(documentName, isDirectory: false))!
    }
    
    func saveToFlatFile() {
        let fileURL = getURL("thirdVC")
        if let saveText = inputText.text {
            do {
                try saveText.writeToURL(fileURL, atomically: true, encoding: NSUTF8StringEncoding)
            } catch {
                print("problem with writing in thirdVC")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showVC4") {
            saveToFlatFile()
        }
    }

}
