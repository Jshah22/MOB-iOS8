//
//  TableVC.swift
//  HW 5
//
//  Created by Jay Shah on 3/5/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class TableVC: UIViewController,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel
        label.text = "\(indexPath.row + 1)"
        
        return cell
    }

    }
