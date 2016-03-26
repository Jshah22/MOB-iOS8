//
//  FourthVC.swift
//  HW 6 Persistence
//
//  Created by Jay Shah on 3/25/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class FourthVC: UIViewController {

    @IBOutlet weak var textFromThirdVC: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let outputText = try String(contentsOfURL: getURL("thirdVC"))
            textFromThirdVC.text = outputText
        } catch {
            print("problem getting text from thirdVC")
        }

    }
    
    func getURL(documentName: String) -> NSURL {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let directory = urls.first!
        
        return directory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }

}
