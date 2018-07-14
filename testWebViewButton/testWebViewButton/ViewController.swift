//
//  ViewController.swift
//  testWebViewButton
//
//  Created by ITCODE on 4/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myURL: NSURL?

    @IBAction func tapButton(sender: AnyObject) {
        let itemURLStr = "https://www.google.com.sg/search?q=Hello world "+myUDID
//        let itemURLStr = "http://mr.g.graham.tripod.com" //test webview dialog box
        // replace spaces from the url with "%20"
        let edittedLink = itemURLStr.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        myURL = NSURL(string: edittedLink)
        
        self.performSegueWithIdentifier("showWebView", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWebView" {
            //default without navigation
            let desView = segue.destinationViewController as! WebViewController
            
            //if have navigation can have different transition animation
//            let desNavView = segue.destinationViewController as! UINavigationController
//            let desView = desNavView.viewControllers[0] as! WebViewController
            
            desView.myLink = myURL
        }
    }
    
}

