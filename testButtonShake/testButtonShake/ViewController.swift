//
//  ViewController.swift
//  testButtonShake
//
//  Created by ITCODE on 30/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myBtn: UIButton!
    @IBAction func pressedMyBtn(sender: AnyObject) {
        
        //simple button shaking. Does not disable when shaking
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(myBtn.center.x - 5, myBtn.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(myBtn.center.x + 5, myBtn.center.y))
        myBtn.layer.addAnimation(animation, forKey: "position")
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

