//
//  ViewController.swift
//  testRedirection
//
//  Created by ITCODE on 8/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func touchUpButton(sender: AnyObject) {
        // method 1
//        let reVC = RedirectionViewController(nibName: nil, bundle: nil)
//        reVC.link = "http://www.incinemas.sg".stringByReplacingOccurrencesOfString(" ", withString: "%20")
//        self.presentViewController(reVC, animated: true, completion: {
//            print("completed presenting view")
//        })
        
        // method 2
//        let reVC = RedirectionViewController(nibName: nil, bundle: nil)
//        reVC.link = "http://www.incinemas.sg".stringByReplacingOccurrencesOfString(" ", withString: "%20")
//        self.navigationController?.pushViewController(reVC, animated: true)
        
        
        // method 3
//        OverlayManager.sharedInstance.showOverlay(self.navigationController?.view, enableControl: true, redirectLink: "")
        OverlayManager.sharedInstance.showOverlay(self.navigationController?.view, enableControl: true, redirectLink: "https://www.incinemas.sg/")

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

