//
//  MainViewController.swift
//  testPageView
//
//  Created by ITCODE on 23/4/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var didTutorSegmentedControl: UISegmentedControl!
    
    @IBAction func didTutorValueChange(sender: UISegmentedControl) {
        let selectedSegment = sender.selectedSegmentIndex
        print("value changed, new \(selectedSegment)")
        
        if selectedSegment == 0 { // true
            defaults.setBool(true, forKey: "IncDidTutor")
        } else { // false
            defaults.setBool(false, forKey: "IncDidTutor")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let didTutor = defaults.boolForKey("IncDidTutor")
        print("viewDidLoad - didTutor = \(didTutor)")
        
        if didTutor {
            didTutorSegmentedControl.selectedSegmentIndex = 0 // true
        } else {
            didTutorSegmentedControl.selectedSegmentIndex = 1 // false
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
