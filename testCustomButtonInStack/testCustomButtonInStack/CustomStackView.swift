//
//  CustomStackView.swift
//  testCustomButtonInStack
//
//  Created by ITCODE on 26/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class CustomStackView: UIStackView {
    // maybe need an array to hold the number of dates it holds
    // init needs to create buttons based on given dates
    var selectedDate = "5/26/2016" //selected
    var displayedDateArray = [String]() //generated: need this because ACTUAL display is different from the webservice dates
    var availableDateArray = ["5/26/2016", "5/27/2016", "5/28/2016", "5/29/2016"] //retrieved from webservice
    var selectedButton: CustomButton!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCustomStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCustomStackView()
    }
    
    func initCustomStackView() {
        print("initCustomStackView")

//        displayedDateArray = ["5/26/2016", "5/27/2016", "5/28/2016", "5/29/2016", "5/30/2016", "5/31/2016", "6/1/2016"] //tests
        
        // when init, clear out displayedDateArray
        displayedDateArray.removeAll()
        
//        var firstSevenDays = [String]() //store mandatory 7 days
        // -- after thought: can just check if contains in the first 7 already in the displayed array
        
        let sixLessToday = NSDate().addHours(-6) // today, offset by 6 hours because our "12am" is at 6am
        
        //loop to create the 7 mandatory days, regardless if available
        for index in 0...6 {
            // create the date to be added next. (first day is increase by 0 days from original date)
            let nextDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: index, toDate: sixLessToday, options: NSCalendarOptions(rawValue: 0))
            
            // formats NSDate into string
            let nextDateStr = incDateTime.datetimeToStr(nextDate!, format: "M/d/yyyy")
            
            // add to arrays for record
//            firstSevenDays.append(nextDateStr) // can just check if exists in displayed date.
            displayedDateArray.append(nextDateStr)
            
            // call function to addButton
            addButton(nextDateStr)
        }
        
        //create advance sales dates
        for advancedDate in availableDateArray {
            // if displayed dates don't contain this available date
            // then it would be considered advanced
            if !(displayedDateArray.contains(advancedDate)) {
                
                // call function to addButton
                addButton(advancedDate)
            }
        }
        
        
        
        // original when testing - simple form
//        for (i,date) in displayedDateArray.enumerate() {
//            // statement ? doOne : doTwo
//            // if statement = true, doOne, else doTwo
//            let dateBtn = availableDateArray.contains(date) ? CustomButton(buttonTitle: date) : CustomButton(buttonTitle: date, enabled: false)
//            
//            self.addArrangedSubview(dateBtn)
//            
//            if self.selectedButton == nil {
//                if self.selectedDate == date {
//                    self.selectButton(dateBtn)
//                }
//            }
//        }
    }
    
    func addButton (dateButtonTitle: String) {
        // create the button based on whether it should be enabled or not
        let dateBtn = availableDateArray.contains(dateButtonTitle) ? CustomButton(buttonTitle: dateButtonTitle) : CustomButton(buttonTitle: dateButtonTitle, enabled: false)
        
        // add the button into subview
        self.addArrangedSubview(dateBtn)
        
        // check if there are no selected buttons
        if self.selectedButton == nil {
            // if not, check if this date is the selected date
            if self.selectedDate == dateButtonTitle {
                // if yes, process select the button.
                self.selectButton(dateBtn)
            }
        }
    }
    
    func selectButton(button: CustomButton) {
//        print("\t\tselected button: \(button.titleLabel?.text)")
        //select single button,
        button.selected = true
        //deselect the rest of the buttons
//        let csvButtons = self.getStackButtons() as! [CustomButton]
        let csvButtons = self.getStackButtons()
        for csvButton in csvButtons {
            if csvButton != button {
                self.deselectButton(csvButton)
            }
        }
    }
    
    func deselectButton(button: CustomButton) {
//        print("\t\tdeselected button: \(button.titleLabel?.text)")
        //deselect button
        button.selected = false
    }
    
    func getSelectedButton() -> CustomButton? {
        let selectedButtons = self.getStackButtons().filter({$0.selected})
        
        if selectedButtons.count == 1 { // equals to 1
            return selectedButtons[0]
        } else if selectedButtons.count > 1 {  // more than 1
            // get the first one, deselect the rest
            if let firstBtn = selectedButtons.first {
                self.selectButton(firstBtn)
            } else {
                return nil
            }
        } else { // less than 1
            // select the first one from stack
            if !(self.getStackButtons().isEmpty) {
                return self.getStackButtons().first!
            } else {
                return nil
            }
        }
        return nil
    }
    
    func getStackButtons() -> [CustomButton] {
        return self.subviews as! [CustomButton]
    }
    
    func updateAvailableDates(datesArray: [String]) { //may have to add completion handler to reload table
        // selecteddate should already be updated by now
        // update the self.displayedDateArray by recreating the 7 days and advanced sales
        // go through the arrangedsubviews and change the dates one by one. add more if needed.
        
        // reassign available dates with new dates
        self.availableDateArray = datesArray
        
        // clean up displayed dates array
        self.displayedDateArray.removeAll()
        
        // clean up subviews
        self.deleteAllSubviews()
        
        let sixLessToday = NSDate().addHours(-6) // today, offset by 6 hours because our "12am" is at 6am
        
        //loop to create the 7 mandatory days, regardless if available
        for index in 0...6 {
            // create the date to be added next. (first day is increase by 0 days from original date)
            let nextDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: index, toDate: sixLessToday, options: NSCalendarOptions(rawValue: 0))
            
            // formats NSDate into string
            let nextDateStr = incDateTime.datetimeToStr(nextDate!, format: "M/d/yyyy")
            
            // add to arrays for record
            //            firstSevenDays.append(nextDateStr) // can just check if exists in displayed date.
            displayedDateArray.append(nextDateStr)
            
            // call function to addButton
            addButton(nextDateStr)
        }
        
        //create advance sales dates
        for advancedDate in availableDateArray {
            // if displayed dates don't contain this available date
            // then it would be considered advanced
            if !(displayedDateArray.contains(advancedDate)) {
                
                // call function to addButton
                addButton(advancedDate)
            }
        }
    }
    
    func deleteAllSubviews() {
        if self.arrangedSubviews.count > 0 {
            for arrangedSubview in self.arrangedSubviews {
                self.removeArrangedSubview(arrangedSubview)
            }
        }
    }
}
