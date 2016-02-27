//
//  ViewController.swift
//  HW #1
//
//  Created by Jay Shah on 2/2/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let navy = UIColor(red: 0, green: 0, blue: 128/255, alpha: 1)
    let pink = UIColor(red: 1, green: 153/255, blue: 204/255, alpha: 1)
    
    @IBOutlet var largeView: UIView!

    @IBAction func buttonClicked(sender: AnyObject) {
        
        largeView.backgroundColor = UIColor.greenColor()
    }
    
    @IBAction func colorNavy(sender: AnyObject) {
        largeView.backgroundColor = navy
    }
    
    @IBAction func colorPink(sender: AnyObject) {
        largeView.backgroundColor = pink
    }
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var outputPhrase: UITextView!
    
    @IBAction func buttonSubmit(sender: AnyObject) {
        outputPhrase.text = "Hello " + inputName.text! + ", how are you?"
    }
}

