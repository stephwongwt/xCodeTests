//
//  ViewController.swift
//  testDatetimeSQL
//
//  Created by ITCODE on 29/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            try SQLiteDataStore.sharedInstance.createTables()
            try LastUpdateDataManager.deleteAll()
        } catch _ {
            print("creating tables or deleting all rows failed")
        }
        
        
        let updateTime = "2/10/2016 4:58:11 PM"
        let datetimeFormatter = NSDateFormatter()
        datetimeFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        datetimeFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        datetimeFormatter.dateFormat = "M/d/yyyy h:mm:ss a"
        
        let nsdateUpdateTime = datetimeFormatter.dateFromString(updateTime)
        print("updatetime Nsdate \(nsdateUpdateTime) VS \(NSDate())")
        
        
        do {
            let inte = try LastUpdateDataManager.insertOne(LastUpdateItem(lastUpdateId: 0, tableName: "testtest", lastUpdateTime: nsdateUpdateTime!, lastCheckTime: NSDate())!)
            print("success row id = \(inte)")
        } catch _ {
            print("there was some error inserting")
        }
        
        
        do {
            if let result = try LastUpdateDataManager.findAll() {
                print("here is all that is in last update")
                for (ind, res) in result.enumerate() {
                    print("\(ind). \(res.getLastUpdateTime()) & \(res.getLastCheckTime())")
                }
            }
        } catch _ {
            print("getting all from last update failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

