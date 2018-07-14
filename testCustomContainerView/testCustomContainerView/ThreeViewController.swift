//
//  ThreeViewController.swift
//  testCustomContainerView
//
//  Created by ITCODE on 5/7/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        let lbl = UILabel()
        lbl.text = "Three"
        
        self.view.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        lbl.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        lbl.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
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
