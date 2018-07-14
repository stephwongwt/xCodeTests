//
//  SecondViewController.swift
//  testNotificationCTA
//
//  Created by ITCODE on 12/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var pageLabel: UILabel!
    @IBAction func touchUpBackPrev(sender: AnyObject) {
        self.performSegueWithIdentifier("backPrev", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pageLabel.text = "No Notifs"
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
