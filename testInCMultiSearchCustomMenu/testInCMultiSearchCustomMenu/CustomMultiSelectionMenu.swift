//
//  CustomMultiSelectionMenu.swift
//  testInCMultiSearchCustomMenu
//
//  Created by ITCODE on 16/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class CustomMultiSelectionMenu: UIStackView {
    
    var savedOption = "By Cinemas"
    var menuOptions = ["By Movies", "By Cinemas", "By Location", "By Map", "By Movie Poster"]
    var selectedOption: CustomMenuOptionButton!
    var parentVC: ViewController?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    convenience init(frame: CGRect, parentvc: ViewController) {
        self.init(frame: frame)
        initCustomMultiSelectionMenu(parentvc)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initCustomMultiSelectionMenu(parentvc: ViewController? = nil) {
        print("initCustomMultiSelectionMenu")
        parentVC = parentvc
        
        // add the buttons
        for opt in menuOptions {
            addMenuOptionButton(opt)
        }
    }
    
    func addMenuOptionButton(title: String) {
        // add button
        
//        let button = UIButton(type: UIButtonType.System)
//        button.setTitle(title, forState: UIControlState.Normal)
        
        let button = CustomMenuOptionButton(buttonTitle: title)
        
        self.addArrangedSubview(button)
        
        // check if there are no selected buttons
        if self.selectedOption == nil {
            // if not, check if this date is the selected date
            if self.savedOption == title {
                // if yes, process select the button.
                self.selectButton(button)
            }
        } else {
            print("selectedOption was NOT nil!")
        }
    }
    
    func selectButton(button: CustomMenuOptionButton) {
        print("\t\tselected button: \(button.titleLabel?.text)")
        
        // set active vc
        if let titleText = button.titleLabel?.text {
            if let prevBtn = selectedOption {
                
                if titleText != prevBtn.titleLabel?.text {
                    
                    switch titleText {
                    case "By Movies":
                        parentVC?.setupMainVC(titleText)
//                        self.parentVC!.activeViewController = MainViewController()
//                        let avc = self.parentVC!.activeViewController as! MainViewController
//                        avc.mainLabel.text = titleText
                        break
                    case "By Cinemas":
                        parentVC?.setupSecondVC(titleText)
//                        self.parentVC!.activeViewController = SecondViewController()
//                        let avc = self.parentVC!.activeViewController as! SecondViewController
//                        avc.mainLabel.text = titleText
                        break
                    case "By Location":
                        parentVC?.setupMainVC(titleText)
//                        self.parentVC!.activeViewController = MainViewController()
//                        let avc = self.parentVC!.activeViewController as! MainViewController
//                        avc.mainLabel.text = titleText
                        break
                    case "By Map":
                        parentVC?.setupSecondVC(titleText)
//                        self.parentVC!.activeViewController = SecondViewController()
//                        let avc = self.parentVC!.activeViewController as! SecondViewController
//                        avc.mainLabel.text = titleText
                        break
                    case "By Movie Poster":
                        parentVC?.setupMainVC(titleText)
//                        self.parentVC!.activeViewController = MainViewController()
//                        let avc = self.parentVC!.activeViewController as! MainViewController
//                        avc.mainLabel.text = titleText
                        break
                    default:
                        break
                    }
                } else {
                    print("same title selected, no change")
                }
            } else {
                print("prev button IS empty")
            }
        } else {
            parentVC?.setupMainVC("Selected Button has no title")
//            self.parentVC!.activeViewController = MainViewController()
//            let avc = self.parentVC!.activeViewController as! MainViewController
//            avc.mainLabel.text = "Selected Button has no title"
        }
        
        
        //select single button
        button.selected = true
        selectedOption = button
        //deselect the rest of the buttons
        let csvButtons = self.getStackButtons()
        for csvButton in csvButtons {
            if csvButton != button {
                self.deselectButton(csvButton)
            }
        }
    }
    
    func deselectButton(button: CustomMenuOptionButton) {
        //        print("\t\tdeselected button: \(button.titleLabel?.text)")
        //deselect button
        button.selected = false
    }
    
    func getStackButtons() -> [CustomMenuOptionButton] {
        return self.subviews as! [CustomMenuOptionButton]
    }
}
