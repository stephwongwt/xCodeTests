//
//  FilterTableViewController.swift
//  testCreateTVCProgrammatically
//
//  Created by ITCODE on 6/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    var filterOptions = ["Time", "Format", "Ticket Type"]
    var timeOptions = ["All", "Morning (6:00am - 11:59am)", "Afternoon (12:00pm - 4:59pm)", "Evening (5:00pm - 11:59pm)", "Midnight (12:00am - 5:59am)"]
    var formatOptions = ["All", "Non-Digital", "Digital", "3D", "IMAX", "IMAX 3D", "3D Atmos", "3D Auro", "Atmos", "Auro", "3D D-Box", "D-Box", "4K", "Omni", "HFR"]
    var ticketTypeOptions = ["All", "Standard", "Gold Class", "Gemini: Two to View", "GVmax", "Grand Seats", "Gold Class Dessert Set", "Gold Class Dining Set", "Eng Sub", "Mums & Babies", "Kids Flix", "Gold Class Sweet Decadence", "Gold Class Magical Romance", "Gold Class Oriental Set", "Gold Class Musical Note", "Blog Aloud", "Gold Class Heroes Set", "Gold Class Justice Set", "Ticket Bundle", "First Class Dining Set", "First Class"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        self.navigationItem.title = "Filters"
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("selected filters when LEAVING filter page BEFORE \(selectedFilters)")
        for selectedFilter in selectedFilters {
            if selectedFilter.1.isEmpty {
                selectedFilters[selectedFilter.0]?.append("All")
            }
        }
        print("selected filters when LEAVING filter page AFTER \(selectedFilters)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return filterOptions.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let option = filterOptions[section]
        
        switch option {
        case "Time":
            return timeOptions.count
        case "Format":
            return formatOptions.count
        case "Ticket Type":
            return ticketTypeOptions.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filterOptions[section]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "No Value"
        cell.accessoryType = .None
        cell.selectionStyle = UITableViewCellSelectionStyle.None
//        cell.tintColor = IncColors.timeBg
        
        let option = filterOptions[indexPath.section]
        
        switch option {
        case "Time":
            cell.textLabel?.text = "\(timeOptions[indexPath.row])"
            if !selectedFilters[option]!.isEmpty {
                for filterOption in selectedFilters[option]! {
                    if filterOption == timeOptions[indexPath.row] {
                        cell.accessoryType = .Checkmark
                        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
                    }
                }
            }
        case "Format":
            cell.textLabel?.text = "\(formatOptions[indexPath.row])"
            if !selectedFilters[option]!.isEmpty {
                for filterOption in selectedFilters[option]! {
                    if filterOption == formatOptions[indexPath.row] {
                        cell.accessoryType = .Checkmark
                        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
                    }
                }
            }
        case "Ticket Type":
            cell.textLabel?.text = "\(ticketTypeOptions[indexPath.row])"
            if !selectedFilters[option]!.isEmpty {
                for filterOption in selectedFilters[option]! {
                    if filterOption == ticketTypeOptions[indexPath.row] {
                        cell.accessoryType = .Checkmark
                        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
                    }
                }
            }
        default:
            cell.textLabel?.text = "No Value"
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.selected {
                
                // add it to the selected options
                
                let option = filterOptions[indexPath.section]
                var currentOptions: [String]?
                
                switch option {
                case "Time":
                    currentOptions = timeOptions
                    break
                case "Format":
                    currentOptions = formatOptions
                    break
                case "Ticket Type":
                    currentOptions = ticketTypeOptions
                    break
                default:
                    break
                }
                
                if currentOptions != nil {
                    if selectedFilters[option]!.contains("All") {// if all is IN selectedFilters
                        if currentOptions![indexPath.row] != "All" {//   if currentselection is NOT all
                            //     remove all from selection
                            if let allIndex = selectedFilters[option]!.indexOf("All") {
                                selectedFilters[option]!.removeAtIndex(allIndex)
                                
                                //remove from table's selected
                                let indexrow = currentOptions!.indexOf("All")
                                let indexpathy = NSIndexPath(forRow: indexrow!, inSection: indexPath.section)
                                tableView.deselectRowAtIndexPath(indexpathy, animated: false)
                                tableView.cellForRowAtIndexPath(indexpathy)?.accessoryType = .None
                            }
                        }
                    } else {// else all is NOT in selectedFilters
                        if currentOptions![indexPath.row] == "All" {//   if currentselection IS all
                            //     remove others
                            for selectedFilter in selectedFilters[option]! {
                                if let selectedFilterIndex = selectedFilters[option]!.indexOf(selectedFilter) {
                                    selectedFilters[option]!.removeAtIndex(selectedFilterIndex)
                                    
                                    //remove from table's selected
                                    let indexrow = currentOptions!.indexOf(selectedFilter)
                                    let indexpathy = NSIndexPath(forRow: indexrow!, inSection: indexPath.section)
                                    tableView.deselectRowAtIndexPath(indexpathy, animated: false)
                                    tableView.cellForRowAtIndexPath(indexpathy)?.accessoryType = .None
                                }
                            }
                        }
                    }
                    selectedFilters[option]!.append(currentOptions![indexPath.row])
                    
                    // and mark the selection and add it to table
                    cell.accessoryType = .Checkmark
                    tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
                }
            }
        }
        
        print("selectedFilters \(selectedFilters) from did select \n")
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            // minus from the selected options
            
            let option = filterOptions[indexPath.section]
            
            switch option {
            case "Time":
                if let index = selectedFilters["\(option)"]?.indexOf(timeOptions[indexPath.row]) {
                    selectedFilters["\(option)"]?.removeAtIndex(index)
                }
                break
            case "Format":
                if let index = selectedFilters["\(option)"]?.indexOf(formatOptions[indexPath.row]) {
                    selectedFilters["\(option)"]?.removeAtIndex(index)
                }
                break
            case "Ticket Type":
                if let index = selectedFilters["\(option)"]?.indexOf(formatOptions[indexPath.row]) {
                    selectedFilters["\(option)"]?.removeAtIndex(index)
                }
                break
            default:
                break
            }
        }
        
        print("selectedFilters \(selectedFilters) from did DEselect \n")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
