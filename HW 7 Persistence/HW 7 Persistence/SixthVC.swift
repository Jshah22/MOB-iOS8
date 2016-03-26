//
//  SixthVC.swift
//  HW 6 Persistence
//
//  Created by Jay Shah on 3/25/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class SixthVC: UIViewController {

    @IBOutlet weak var textFromFifthVC: UITextView!
    var output: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arraySaved = NSArray(contentsOfURL: getURL("input"))
        self.output = arraySaved as! [String]
        let stringShown = output.joinWithSeparator(" ")
        textFromFifthVC.text = stringShown

    }
    func getURL(documentName: String) -> NSURL {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let directory = urls.first
        
        return directory!.URLByAppendingPathComponent(documentName, isDirectory: false)
    }

}
