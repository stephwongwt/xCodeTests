//
//  TutorialLastViewController.swift
//  testPageView
//
//  Created by ITCODE on 23/4/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class TutorialLastViewController: UIViewController {
    @IBAction func touchUpFinishTutBtn(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "IncDidTutor")
        
        
        
        print("touchUpFinishTutBtn and defaults = \(defaults.boolForKey("IncDidTutor"))")
        
        self.performSegueWithIdentifier("finishTutorial", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
