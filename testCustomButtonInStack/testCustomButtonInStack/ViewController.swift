//
//  ViewController.swift
//  testCustomButtonInStack
//
//  Created by ITCODE on 25/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollViewOne: UIScrollView! // already has button. to test group mentality concept.
    @IBOutlet weak var scrollViewTwo: UIScrollView! // programmatically created content.
    
    @IBOutlet weak var stackViewOne: UIStackView! // holds interface buttons - was CustomStackView, changed to UIStackView to disable
    var stackViewTwo: CustomStackView! //holds programmatically created button
    
    @IBAction func touchUpGetButton(sender: AnyObject) {
//        if let selectedBtnOne = stackViewOne.getSelectedButton() {
//            oneLabel.text = "Selected One: \(selectedBtnOne.titleLabel!.text)"
//        } else {
//            oneLabel.text = "Selected One: is nil"
//        }
//        
        if let selectedBtnTwo = stackViewTwo.getSelectedButton() {
            twoLabel.text = "Selected Two: \(selectedBtnTwo.titleLabel!.text)"
        } else {
            twoLabel.text = "Selected Two: is nil"
        }
    }
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    
    @IBAction func touchUpChangeDates(sender: AnyObject) {
        stackViewTwo.selectedDate = stackViewTwo.selectedDate == "5/26/2016" ? "6/1/2016" : "5/26/2016"
        let dateArray = stackViewTwo.availableDateArray.count == 4 ? ["5/30/2016", "5/31/2016", "6/1/2016", "6/2/2016", "6/3/2016"] : ["5/26/2016", "5/27/2016", "5/28/2016", "5/29/2016"]
        stackViewTwo.updateAvailableDates(dateArray)
        print("stackViewTwo has \(stackViewTwo.arrangedSubviews.count) arranged subviews")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let subviews = stackViewOne.getStackButtons()
//        for (index, subview) in subviews.enumerate() {
//            if subview.isKindOfClass(UIButton) {
//                let btn = subview as! UIButton
//                print("at \(index), we have: \(btn.titleLabel?.text)")
//            }
//        }
        
        
        createStackView()
    }
    
    func createStackView() {
        
        stackViewTwo = CustomStackView(frame: scrollViewTwo.frame)
        stackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        stackViewTwo.axis = .Horizontal
        stackViewTwo.alignment = .Center
        stackViewTwo.spacing = 15
        
        scrollViewTwo.addSubview(stackViewTwo)
        
        scrollViewTwo.leadingAnchor.constraintEqualToAnchor(stackViewTwo.leadingAnchor, constant: 0.0).active = true
        scrollViewTwo.topAnchor.constraintEqualToAnchor(stackViewTwo.topAnchor, constant: 0.0).active = true
        scrollViewTwo.bottomAnchor.constraintEqualToAnchor(stackViewTwo.bottomAnchor, constant: 0.0).active = true
        scrollViewTwo.trailingAnchor.constraintEqualToAnchor(stackViewTwo.trailingAnchor, constant: 0.0).active = true
        
        scrollViewTwo.centerYAnchor.constraintEqualToAnchor(stackViewTwo.centerYAnchor, constant: 0.0).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

