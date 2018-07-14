//
//  RadioButton.swift
//  testRadioButtons
//
//  Created by ITCODE on 25/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
//    @IBOutlet var grpButtons : [RadioButton]!

    var sharedLinks: [RadioButton]?
    
    var selectedButton: RadioButton? {
        print("selectedButton")
        print("sharedLinks = \(self.sharedLinks?.count))")
        if self.selected {
            return self
        } else {
            if let selfSharedLinks = self.sharedLinks {
                return selfSharedLinks.filter({$0.selected})[0]
            }
        }
        return nil
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if !self.allTargets().contains(self) {
            super.addTarget(self, action: #selector(RadioButton.onTouchUpInside), forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if !self.allTargets().contains(self) {
            super.addTarget(self, action: #selector(RadioButton.onTouchUpInside), forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    override func awakeFromNib() {
        if !self.allTargets().contains(self) {
            super.addTarget(self, action: #selector(RadioButton.onTouchUpInside), forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    override func addTarget(target: AnyObject?, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        if !self.allTargets().contains(self) {
            super.addTarget(self, action: #selector(RadioButton.onTouchUpInside), forControlEvents: UIControlEvents.TouchUpInside)
        }
        super.addTarget(target, action: action, forControlEvents: controlEvents)
    }
    
    func onTouchUpInside() {
        print("\nonTouchUpInside")
        self.setSelected(true, distinct: true, sendControlEvent: true)
    }
    
    func setGroupButtons(buttons: [RadioButton]) {
        print("setGroupButtons: \(buttons.map({$0.titleLabel!.text}))")
        if self.sharedLinks == nil {
            for rb in buttons {
                if (rb.sharedLinks != nil) {
                    self.sharedLinks = rb.sharedLinks
                }
            }
            if self.sharedLinks == nil {
                self.sharedLinks = [RadioButton]()
            }
        }
        
        //after the above, base on assumption that sharedlinks is not nil
        if !(self.sharedLinks!.contains(self)) {
            self.sharedLinks!.append(self)
        }
        
        for rb in buttons {
            if let rbSharedLinks = rb.sharedLinks {
                if rbSharedLinks != self.sharedLinks! {
                    for sharedLink in rbSharedLinks {
                        if !(self.sharedLinks!.contains(sharedLink)) {
                            self.sharedLinks!.append(sharedLink)
                            sharedLink.sharedLinks = self.sharedLinks
                        }
                    }
                }
            } else {
                rb.sharedLinks = self.sharedLinks!
            }
            if !(self.sharedLinks!.contains(rb)) {
                self.sharedLinks?.append(rb)
            }
        }
    }
    
    func groupButtons() -> [RadioButton]? {
        print("groupButtons")
        if let selfSharedLinks = self.sharedLinks where selfSharedLinks.count > 0 {
            return sharedLinks
        }
        return nil
    }
    
//    func selectedButton() -> RadioButton? {
//        if self.selected {
//            return self
//        } else {
//            if let selfSharedLinks = self.sharedLinks {
//                return selfSharedLinks.filter({$0.selected})[0]
//            }
//        }
//        return nil
//    }
    
    func setSelectedBtn(selected:Bool) {
        print("setSelectedBtn: \(selected)")
        // If selected==YES, then it selects the button and deselects other buttons in the group.
        // If selected==NO, then it deselects the button and if there are only two buttons in the group, then it selects second.
        self.setSelected(selected, distinct: true, sendControlEvent: false)
    }
    
    func setButtonSelected(selected: Bool, sendControlEvent: Bool) {
        print("setButtonSelected: \(selected) & sendControlEvent:\(sendControlEvent)")
        let valueChanged: Bool = (self.selected != selected)
//        super.selected = selected
        self.selected = selected
        if valueChanged && sendControlEvent {
            self.sendActionsForControlEvents(.ValueChanged)
        }
    }
    
    func setSelected(selected: Bool, distinct: Bool, sendControlEvent: Bool) {
        print("setSelected: \(selected) & distinct:\(distinct) & sendControlEvent:\(sendControlEvent)")
        self.setButtonSelected(selected, sendControlEvent: sendControlEvent)
        if distinct && (selected || self.sharedLinks!.count == 2) {
            let newSelected = !selected
            for sharedLink in self.sharedLinks! {
                if sharedLink != self {
                    sharedLink.setButtonSelected(newSelected, sendControlEvent: sendControlEvent)
                }
            }
        }
    }
    
    func deselectAllButtons() {
        print("deselectAllButtons")
        for sharedLink in self.sharedLinks! {
            sharedLink.setButtonSelected(false, sendControlEvent: false)
        }
    }
    
    func setSelectedBtnWithTag(tag:Int) {
        print("setSelectedBtnWithTag: \(tag)")
        // Find first radio with given tag and makes it selected.
        // All of other buttons in the group become deselected.
        if self.tag == tag {
            self.setSelected(true, distinct: true, sendControlEvent: false)
        } else {
            for sharedLink in self.sharedLinks! {
                if sharedLink.tag == tag {
                    sharedLink.setSelected(true, distinct: true, sendControlEvent: false)
                }
            }
        }
        
    }
    
    deinit {
        print("deinit")
        for (index, sharedLink) in self.sharedLinks!.enumerate() {
            if sharedLink == self {
                self.sharedLinks!.removeAtIndex(index)
            }
        }
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
