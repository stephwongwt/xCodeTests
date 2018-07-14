//
//  CustomXIBButton.swift
//  testCustomXIBButton
//
//  Created by ITCODE on 24/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class CustomXIBButton: UIButton {
    
//    var topText: String!
//    var btmText: String!
    var myself: UIButton!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadButtonFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadButtonFromNib()
    }
    
    func loadButtonFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CustomXIBButton", bundle: bundle)
        let button = nib.instantiateWithOwner(self, options: nil)[0] as! UIButton
        
//        button.frame = bounds
//        button.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//        
//        button.backgroundColor = UIColor.clearColor()
//        button.layer.cornerRadius = 5.0
//        button.layer.borderColor = UIColor.greenColor().CGColor
//        button.layer.borderWidth = 1.0
//        //        button.frame = CGRectMake(0, 0, 100, 50)
//        button.enabled = true
//        button.contentEdgeInsets = UIEdgeInsetsMake(5.0, 15.0, 5.0, 15.0)
//        button.titleLabel?.text = ""
        
        
        myself = button
        
        myself.frame = bounds
        myself.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        myself.backgroundColor = UIColor.clearColor()
        myself.layer.cornerRadius = 5.0
        myself.layer.borderColor = UIColor.greenColor().CGColor
        myself.layer.borderWidth = 1.0
//        button.frame = CGRectMake(0, 0, 100, 50)
        myself.enabled = true
        myself.userInteractionEnabled = true
        myself.contentEdgeInsets = UIEdgeInsetsMake(5.0, 15.0, 5.0, 15.0)
        myself.titleLabel?.text = ""
        
//        //set button for double line with 2 fonts
//        //applying the line break mode
//        button.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        //make the text centralised
//        button.titleLabel?.textAlignment = NSTextAlignment.Center
        
//        self.addSubview(button)
        self.addSubview(myself)
    }
    
    func setSpecialButtonTitle(buttonTextTop: String, buttonTextBtm: String, enabled: Bool = true) {
        print("set up extra with buttonTextTop = \(buttonTextTop) & buttonTextBtm = \(buttonTextBtm)")
        
        let buttonText: NSString = "\(buttonTextTop.uppercaseString)\n\(buttonTextBtm.uppercaseString)"
        
        //set button for double line with 2 fonts
        //applying the line break mode
        self.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        //make the text centralised
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        
        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.rangeOfString("\n")
        
        //getting both substrings
        var substringOne: NSString = ""
        var substringTwo: NSString = ""
        
        if(newlineRange.location != NSNotFound) {
            substringOne = buttonText.substringToIndex(newlineRange.location)
            substringTwo = buttonText.substringFromIndex(newlineRange.location)
        }
        
        //assigning diffrent fonts to both substrings
        //for top label
        let fontOne:UIFont? = UIFont(name: "Arial", size: 21.0) //to change to barmeno
        var attrsOne = [NSFontAttributeName: fontOne!, NSForegroundColorAttributeName:UIColor.blackColor()]
        
        //is button enabled or disabled set different attrs
        if enabled == false {
            // put disabled buttons
            self.enabled = false
            self.userInteractionEnabled = false
            myself.layer.borderColor = UIColor.grayColor().CGColor
            attrsOne = [NSFontAttributeName: fontOne!, NSForegroundColorAttributeName:UIColor.grayColor()]
        }
        
        let attrStringOne = NSMutableAttributedString(string: substringOne as String, attributes: attrsOne)
        
        //for bottom label
        let fontTwo:UIFont? = UIFont(name: "Arial", size: 10.0)
        let attrsTwo = [NSFontAttributeName: fontTwo!, NSForegroundColorAttributeName:UIColor.grayColor()]
        let attrStringTwo = NSMutableAttributedString(string: substringTwo as String, attributes: attrsTwo)
        
        //appending both attributed strings
        attrStringOne.appendAttributedString(attrStringTwo)
        
        //assigning the resultant attributed strings to the button
        self.setAttributedTitle(attrStringOne, forState: UIControlState.Normal)
    }
    
    func changeBorderColor(color: CGColor) {
//        self.layer.cornerRadius = 5.0
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = color
        myself.layer.borderColor = color
    }
}
