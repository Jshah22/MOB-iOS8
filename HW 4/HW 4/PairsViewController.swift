//
//  PairsViewController.swift
//  HW 4
//
//  Created by Jay Shah on 2/27/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class PairsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var keyAndValue = [String:String] ()

    @IBOutlet weak var keyText: UITextField!
    
    @IBOutlet weak var valueText: UITextField!
    
    @IBOutlet weak var listInTable: UITableView!
    
    @IBAction func addToTable(sender: AnyObject) {
        keyAndValue[keyText.text!] = valueText.text!
        print(keyAndValue)
        listInTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.view.backgroundColor = UIColor.blueColor()
        })
        self.view.backgroundColor = UIColor.redColor()
        
        listInTable.dataSource = self
        listInTable.delegate = self
        keyText.becomeFirstResponder()
        valueText.becomeFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    func keyboardWillShow(notification: NSNotification) {
        keyText.backgroundColor = UIColor.blueColor()
        valueText.backgroundColor = UIColor.blueColor()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        keyText.backgroundColor = UIColor.redColor()
        valueText.backgroundColor = UIColor.redColor()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pairedItems", forIndexPath: indexPath)
        let key = Array(keyAndValue.keys)[indexPath.row]
        let value = Array(keyAndValue.values)[indexPath.row]
        cell.textLabel?.text = key + " - " + value
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyAndValue.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell?.accessoryType == .Checkmark {
            cell?.accessoryType = .None
        } else {
            cell?.accessoryType = .Checkmark
        }
        cell?.selected = false
    }

    }


