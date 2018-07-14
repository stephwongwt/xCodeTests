//
//  ViewController.swift
//  testCustomMenuController
//
//  Created by ITCODE on 5/7/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //containervc
    @IBOutlet weak var menuVC: UIView!
    @IBOutlet weak var mainVC: UIView!
    @IBOutlet weak var profileVC: UIView!
    
    @IBAction func menuBtnTapped(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("tappedMenu", object: nil)
    }
    
    @IBAction func profileBtnTapped(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("tappedProfile", object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShareSettings.menuTapped = false
        ShareSettings.profileTapped = false

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tappedMenu), name: "tappedMenu", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tappedProfile), name: "tappedProfile", object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "tappedMenu", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "tappedProfile", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedMenu() {
        self.view.bringSubviewToFront(menuVC)
        if let tapmenu = ShareSettings.menuTapped where tapmenu == true {
            //not activated
            UIView.animateWithDuration(0.3, animations: {
                self.mainVC.frame = CGRectMake(0, self.mainVC.frame.origin.y, self.mainVC.frame.size.width, self.mainVC.frame.size.height)
                self.menuVC.frame = CGRectMake(-self.menuVC.frame.size.width, self.menuVC.frame.origin.y, self.menuVC.frame.size.width, self.menuVC.frame.size.height)
            })
        } else {
            //activated
            UIView.animateWithDuration(0.3, animations: {
                self.mainVC.frame = CGRectMake(self.menuVC.frame.size.width, self.mainVC.frame.origin.y, self.mainVC.frame.size.width, self.mainVC.frame.size.height)
                self.menuVC.frame = CGRectMake(0, self.menuVC.frame.origin.y, self.menuVC.frame.size.width, self.menuVC.frame.size.height)
            })
        }
        
        ShareSettings.menuTapped = !ShareSettings.menuTapped
        
        if ShareSettings.profileTapped == true {
            ShareSettings.profileTapped = false
        }
    }
    
    func tappedProfile() {
        self.view.bringSubviewToFront(profileVC)
        if let tapprofile = ShareSettings.profileTapped where tapprofile == true {
            //not activated
            UIView.animateWithDuration(0.3, animations: {
                self.mainVC.frame = CGRectMake(0, self.mainVC.frame.origin.y, self.mainVC.frame.size.width, self.mainVC.frame.size.height)
                self.profileVC.frame = CGRectMake(self.mainVC.frame.size.width, self.profileVC.frame.origin.y, self.profileVC.frame.size.width, self.profileVC.frame.size.height)
            })
        } else {
            //activated
            UIView.animateWithDuration(0.3, animations: {
                self.mainVC.frame = CGRectMake(-self.profileVC.frame.size.width, self.mainVC.frame.origin.y, self.mainVC.frame.size.width, self.mainVC.frame.size.height)
                self.profileVC.frame = CGRectMake(self.mainVC.frame.size.width-self.profileVC.frame.size.width, self.profileVC.frame.origin.y, self.profileVC.frame.size.width, self.profileVC.frame.size.height)
            })
        }
        
        ShareSettings.profileTapped = !ShareSettings.profileTapped
        
        if ShareSettings.menuTapped == true {
            ShareSettings.menuTapped = false
        }
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
