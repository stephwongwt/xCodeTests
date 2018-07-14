//
//  CustomButton.swift
//  testCustomButtonInStack
//
//  Created by ITCODE on 26/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var customButtonDate: String!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
//    override func titleColorForState(state: UIControlState) -> UIColor? {
//        switch state {
//        case UIControlState.Selected:
//            return UIColor.orangeColor()
//        default:
//            return UIColor.whiteColor()
//        }
//    }
    
    // should not be used as this is for initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        print("init?(coder aDecoder: NSCoder)")
        if let title = self.titleLabel {
            if let titleText = title.text {
                initButtonWithAttributes(titleText, enabled: enabled)
            } else {
                initButtonWithAttributes(nil, enabled: enabled)
            }
        } else {
            initButtonWithAttributes(nil, enabled: enabled)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        print("init(frame: CGRect)")
        // this is always called when creating buttons programmatically through the convenience init
//        if let title = self.titleLabel {
//            if let titleText = title.text {
//                initButtonWithAttributes(titleText)
//            } else {
//                initButtonWithAttributes()
//            }
//        } else {
//            initButtonWithAttributes()
//        }
    }
    
    convenience init(buttonTitle: String, enabled: Bool = true) {
        self.init()
//        print("init(buttonTitle: String)")
        if let title = self.titleLabel {
            if let titleText = title.text {
                initButtonWithAttributes(titleText, enabled: enabled)
            } else {
                initButtonWithAttributes(buttonTitle, enabled: enabled)
            }
        } else {
            initButtonWithAttributes(buttonTitle, enabled: enabled)
        }
    }
    
    func initButtonWithAttributes(buttonTitle: String? = nil, enabled: Bool = true) {
        print("initButtonWithAttributes title: \(buttonTitle) and enabled: \(enabled)")
        self.customButtonDate = buttonTitle
        
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = enabled ? UIColor.greenColor().CGColor : UIColor.redColor().CGColor
        self.enabled = enabled
        self.userInteractionEnabled = enabled
        self.frame = CGRectMake(0, 0, 100, 50)
        self.contentEdgeInsets = UIEdgeInsetsMake(5.0, 15.0, 5.0, 15.0)
        if let title = buttonTitle {
            self.setTitle(title, forState: UIControlState.Normal)
        } else {
            self.setTitle("no title", forState: UIControlState.Normal)
        }
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Selected)
        
        self.addTarget(self, action: #selector(CustomButton.touchUpInside(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }

    func touchUpInside(button: CustomButton) {
        print("\ntouched up button: \(button.titleLabel?.text)")
        
        // select self
//        if button.selected {
//            button.selected = false
//        } else {
//            button.selected = true
//        }
        
        // checks
        if button.superview!.isKindOfClass(CustomStackView) {
//            print("\tbutton's super is CustomStackView")
            let csv = button.superview as! CustomStackView
            if !button.selected {
                csv.selectButton(button)
            }/* else {
                csv.deselectButton(button)
            }*/
            
//            let csvButtons = csv.getStackButtons() as! [CustomButton]
//            
//            print("    the super contains: \(csvButtons.map({$0.titleLabel?.text})) and self = \(csvButtons.contains(button))")
//            print("    selected buttons are \(csvButtons.filter({$0.selected}).map({$0.titleLabel?.text}))")
        }
    }
    
    override var selected: Bool {
        willSet {
//            print("changing from selected:\(selected) to newValue:\(newValue)")
        }
        
        didSet {
//            print("\t\t\tchanged from oldValue:\(oldValue) to selected:\(selected)")
            if oldValue != selected {
                switch selected {
                case true:
//                    print("\t\t\tit is true!")
                    self.backgroundColor = UIColor.blueColor()
                    break
                case false:
//                    print("\t\t\tit is false!")
                    self.backgroundColor = UIColor.clearColor()
                    break
                }
            }
        }
    }
}
