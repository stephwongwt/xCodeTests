//
//  ViewController.swift
//  testCreateTVCProgrammatically
//
//  Created by ITCODE on 6/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

var selectedFilters = ["Time":["All"],"Format":["All"],"Ticket Type":["All"]]

class ViewController: UIViewController {
    
    @IBAction func gotoTVC(sender: AnyObject) {
        
        let tvc = FilterTableViewController(style: UITableViewStyle.Plain)
        tvc.tableView.allowsMultipleSelection = true
        
        
        self.navigationController?.pushViewController(tvc, animated: true) // used if self has NVC
        
//        let nvc = UINavigationController(rootViewController: tvc)
        
//        self.presentViewController(nvc, animated: true, completion: {
//            print("presented nvc")
//        })
    }
    @IBOutlet weak var selectedFiltersLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        var text = ""
        for (key, values) in selectedFilters {
            text = text + "\(key): \(values.map({$0}))\n\n"
        }
        selectedFiltersLabel.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

