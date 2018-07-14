//
//  ViewController.swift
//  testNotificationDot
//
//  Created by ITCODE on 1/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tappedButton(sender: AnyObject) {
        let button = navigationItem.rightBarButtonItem?.customView as! MenuButton
        button.notify = button.notify ? false:true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let leftMenuBtn = MenuButton(frame: CGRectMake(0, 0, 40, 30))
        leftMenuBtn.addTarget(self, action: #selector(ViewController.touchUpButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftMenuBtn)
        
        let rightMenuBtn = MenuButton(frame: CGRectMake(0, 0, 40, 30))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightMenuBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func touchUpButton(sender: UIButton) {
        print("touched button")
        print("superview.superview is menubutton = \(sender.superview?.superview?.isKindOfClass(MenuButton))")
        if let mb = sender.superview!.superview as? MenuButton {
            mb.notify = mb.notify ? false:true
        }
    }
}












