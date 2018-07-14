//
//  ViewController.swift
//  testFullOverlay
//
//  Created by ITCODE on 11/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func touchUpDisplayViewBtn(sender: AnyObject) {
        LoadingOverlay.shared.showOverlay(self.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //only apply the blur if the user hasn't disabled transparency effects
//        if !UIAccessibilityIsReduceTransparencyEnabled() {
//            self.view.backgroundColor = UIColor.clearColor()
//            
//            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
//            let blurEffectView = UIVisualEffectView(effect: blurEffect)
//            //always fill the view
//            blurEffectView.frame = self.view.bounds
//            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//            
//            self.view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
//        } 
//        else {
//            self.view.backgroundColor = UIColor.blackColor()
//        }
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            LoadingOverlay.shared.showOverlay(self.view)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

