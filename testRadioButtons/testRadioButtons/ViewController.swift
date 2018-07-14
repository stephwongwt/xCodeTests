//
//  ViewController.swift
//  testRadioButtons
//
//  Created by ITCODE on 25/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [RadioButton]!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var radioButtonOne: RadioButton!
    @IBAction func touchUpRadioButton(sender: RadioButton) {
        valueLabel.text = "Selected: \(radioButtonOne.sharedLinks!.filter({$0.selected}).map({$0.titleLabel!.text}))"
        print("touch up get selectedButton: \(radioButtonOne.selectedButton?.titleLabel?.text)")
//        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
//        dispatch_after(delayTime, dispatch_get_main_queue()) {
//            print("delayed: \(self.radioButtonOne.sharedLinks?.filter({$0.selected}).map({$0.titleLabel?.text}))")
//        }
    }
    @IBAction func refreshBtn(sender: AnyObject) {
        valueLabel.text = "Refreshed Selected: \(radioButtonOne.sharedLinks!.filter({$0.selected}).map({$0.titleLabel!.text}))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        for button in buttons {
//            print(button.titleLabel?.text)
//        }
        
        radioButtonOne.setGroupButtons(buttons)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

