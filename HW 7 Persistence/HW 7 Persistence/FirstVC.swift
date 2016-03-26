//
//  ViewController.swift
//  HW 6 Persistence
//
//  Created by Jay Shah on 3/25/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    @IBOutlet weak var displayedText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayedText.text = showTestStringAndTestNumber()
    }
    
    func showTestStringAndTestNumber() -> String {
        if let testString = NSUserDefaults.standardUserDefaults().stringForKey("test_string"), testNumber = NSUserDefaults.standardUserDefaults().objectForKey("test_number") as? Double {
            return "\(testString) \(testNumber)"
        } else {
            return ""
        }
    }

}

