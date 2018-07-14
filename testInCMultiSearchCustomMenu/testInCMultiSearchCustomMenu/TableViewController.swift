//
//  TableViewController.swift
//  testInCMultiSearchCustomMenu
//
//  Created by ITCODE on 18/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataArray: [String]!
    var fromButton: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = dataArray[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("DID select! from \(fromButton)")
        self.performSegueWithIdentifier("unwindFromTableToVC", sender: dataArray[indexPath.row])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        print("segue-ing! id \(segue.identifier)")
        if segue.identifier == "unwindFromTableToVC" {
            
            if let destView = segue.destinationViewController as? ViewController {
                if let avc = destView.activeViewController as? MainViewController {
                    switch fromButton {
                    case "buttonOne":
                        print("unwinding button 1!")
                        avc.labelOne.text = sender as? String
                        break
                    case "buttonTwo":
                        print("unwinding button 2!")
                        avc.labelTwo.text = sender as? String
                        break
                    case "buttonThree":
                        print("unwinding button 3!")
                        avc.labelThree.text = sender as? String
                        break
                    default:
                        break
                    }
                } else if let avc = destView.activeViewController as? SecondViewController {
                    switch fromButton {
                    case "buttonOne":
                        print("unwinding button 1!")
                        avc.labelOne.text = "secondView: \(sender as! String)"
                        break
                    case "buttonTwo":
                        print("unwinding button 2!")
                        avc.labelTwo.text = "secondView: \(sender as! String)"
                        break
                    case "buttonThree":
                        print("unwinding button 3!")
                        avc.labelThree.text = "secondView: \(sender as! String)"
                        break
                    default:
                        break
                    }
                }
            }
        }
    }

}
