//
//  SecondVC.swift
//  HW 6 Persistence
//
//  Created by Jay Shah on 3/25/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var displayedText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayedText.text = showTextFieldAndSlider()
    }
    
    func showTextFieldAndSlider() ->String {
        if let textField = NSUserDefaults.standardUserDefaults().stringForKey("settings_name"), slider = NSUserDefaults.standardUserDefaults().objectForKey("settings_slider") as? Double {
            
            return "\(textField) \(slider)"
        } else {
            return ""
        }
    }

}
