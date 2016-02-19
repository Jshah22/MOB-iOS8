//
//  ViewController.swift
//  HW 3
//
//  Created by Jay Shah on 2/14/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerToSecond() {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as! SecondViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    

    @IBAction func rightSwipe(sender: AnyObject) {
        viewControllerToSecond()
        backgroundImage.hidden = (Bool: false)
                }
    @IBAction func leftSwipe(sender: AnyObject) {
        viewControllerToSecond()
        backgroundImage.hidden = (Bool: false)
            }
    
    @IBAction func showArrayTable(sender: AnyObject) {
        performSegueWithIdentifier("mainToArray", sender: sender)
        
    }
}

