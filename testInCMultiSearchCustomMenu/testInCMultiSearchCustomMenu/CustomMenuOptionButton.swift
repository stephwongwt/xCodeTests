//
//  CustomMenuOptionButton.swift
//  testInCMultiSearchCustomMenu
//
//  Created by ITCODE on 16/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class CustomMenuOptionButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if let title = self.titleLabel {
            if let titleText = title.text {
                initButtonWithAttributes(titleText)
            } else {
                initButtonWithAttributes(nil)
            }
        } else {
            initButtonWithAttributes(nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(buttonTitle: String) {
        self.init()
        if let title = self.titleLabel {
            if let titleText = title.text {
                initButtonWithAttributes(titleText)
            } else {
                initButtonWithAttributes(buttonTitle)
            }
        } else {
            initButtonWithAttributes(buttonTitle)
        }
    }
    
    func initButtonWithAttributes(buttonTitle: String? = nil) {
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
        
        self.addTarget(self, action: #selector(CustomMenuOptionButton.touchUpInside(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func touchUpInside(button: CustomMenuOptionButton) {
        print("\ntouched up button: \(button.titleLabel?.text)")
        
        // checks
        if button.superview!.isKindOfClass(CustomMultiSelectionMenu) {
            let csv = button.superview as! CustomMultiSelectionMenu
            if !button.selected {
                csv.selectButton(button)
            }
        }
    }
}
