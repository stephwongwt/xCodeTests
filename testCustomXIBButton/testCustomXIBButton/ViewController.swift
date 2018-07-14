//
//  ViewController.swift
//  testCustomXIBButton
//
//  Created by ITCODE on 24/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var customXibButtonOne: CustomXIBButton!
    var customXibButtonTwo: CustomXIBButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customXibButtonOne = CustomXIBButton(frame: CGRectMake(100, 100, 100, 50))
        customXibButtonTwo = CustomXIBButton(frame: CGRectMake(100, 300, 100, 50))
        
        self.view.addSubview(customXibButtonOne)
        self.view.addSubview(customXibButtonTwo)
        
        customXibButtonOne.setSpecialButtonTitle("toptext", buttonTextBtm: "true", enabled: true)
        customXibButtonTwo.setSpecialButtonTitle("One", buttonTextBtm: "false", enabled: false)
        customXibButtonOne.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        customXibButtonTwo.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        print("cxb One enabled = \(customXibButtonOne.enabled)")
        print("cxb Two enabled = \(customXibButtonTwo.enabled)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func tappedButton(button: UIButton) {
        print("tap tap")
    }
}

