

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var stuffList : [String] = []
    @IBOutlet weak var listOfStuff: UITableView!
    
    @IBOutlet weak var userInputList: UITextField!
    
    @IBAction func addStuffToList(sender: AnyObject) {
        stuffList.append(userInputList.text!)
        userInputList.text = ""
        
        print(stuffList)
        listOfStuff.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuffList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("itemOnList", forIndexPath: indexPath)
        
        cell.textLabel?.text = stuffList[indexPath.row]
        return cell
    }

    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.view.backgroundColor = UIColor.blueColor()
        })
        self.view.backgroundColor = UIColor.redColor()
        
        listOfStuff.dataSource = self
        listOfStuff.delegate = self
        
        userInputList.becomeFirstResponder()
        
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
        userInputList.backgroundColor = UIColor.blueColor()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        userInputList.backgroundColor = UIColor.redColor()
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




