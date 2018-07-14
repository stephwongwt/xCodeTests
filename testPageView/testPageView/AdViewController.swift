//
//  AdViewController.swift
//  testPageView
//
//  Created by ITCODE on 23/4/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        //First get the nsObject by defining as an optional anyObject
        let nsObject: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"]
        //Then just cast the object as a String, but be careful, you may want to double check for nil
        let currentInstalledVersion = Int(nsObject as! String)
        
        if let lastCheckVersionStr = defaults.valueForKey("IncDidTutorLastCheckVersion") {
            let lastCheckVersion = lastCheckVersionStr as! Int
            print("current version = \(currentInstalledVersion)")
            if currentInstalledVersion != lastCheckVersion {
                print("\(currentInstalledVersion) and \(lastCheckVersion) not same")
                defaults.setObject(currentInstalledVersion, forKey: "IncDidTutorLastCheckVersion")
                defaults.setBool(false, forKey: "IncDidTutor")
            }
        } else {
            defaults.setObject(currentInstalledVersion, forKey: "IncDidTutorLastCheckVersion")
            //choose set object because anyobject can be nil
        }
        
        let didTutor = defaults.boolForKey("IncDidTutor")
        
        if didTutor {
            dispatch_async(dispatch_get_main_queue()) {
                [unowned self] in
                self.performSegueWithIdentifier("skipAdToView", sender: self)
            }
        } else {
            dispatch_async(dispatch_get_main_queue()) {
                [unowned self] in
                self.performSegueWithIdentifier("skipAdToTutorial", sender: self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
