//
//  NextViewController.swift
//  testInCMultiSearchCustomMenu
//
//  Created by ITCODE on 19/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var valueOne: String! = "default"
    var valueTwo: String! = "default"
    var valueThree: String! = "default"
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelOne.text = valueOne
        labelTwo.text = valueTwo
        labelThree.text = valueThree
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
