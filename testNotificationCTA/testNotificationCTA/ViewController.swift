//
//  ViewController.swift
//  testNotificationCTA
//
//  Created by ITCODE on 12/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchedUpButton(sender: AnyObject) {
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!" // the message
        notification.alertAction = "be awesome!" // the CTA
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    @IBAction func touchUpGoNext(sender: AnyObject) {
        self.performSegueWithIdentifier("GoNext", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

