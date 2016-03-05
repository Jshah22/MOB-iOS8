//
//  CenteredButtonVC.swift
//  HW 5
//
//  Created by Jay Shah on 3/5/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class CenteredButtonVC: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = UIColor.greenColor()
                   }
    @IBAction func centerButton(sender: AnyObject) {
        if button.backgroundColor == UIColor.greenColor() {
            button.backgroundColor = UIColor.redColor()
        } else {
            button.backgroundColor = UIColor.greenColor()
        }
           }

     }
