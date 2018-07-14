//
//  SwiftExtensions.swift
//  testIncinemasAppFlow
//
//  Created by ITCODE on 15/1/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class IncDateTime { //converts various update times and such into date or time formats that I want
    
    let dateFormatter = NSDateFormatter()
    required init() {
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    }
        
    func strToDatetime (dateStr:String, format:String = "yyyy-MM-dd hh:mm:ss.SSS") -> NSDate {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(dateStr)!
    }
    
    
    func datetimeToStr (date:NSDate, format:String = "yyyy-MM-dd hh:mm:ss") -> String {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(date)
    }
    
    func compareTwoDatesFromStrings (oldDatetime: String, newDatetime: String, format: String = "yyyy-MM-dd hh:mm:ss.SSS") -> Bool {
        let userCalendar = NSCalendar.currentCalendar()
//        let dateMaker = NSDateFormatter()
//        dateMaker.dateFormat = format
//        let oldDay = dateMaker.dateFromString(oldDatetime)!
//        let newDay = dateMaker.dateFromString(newDatetime)!
        dateFormatter.dateFormat = format
        let oldDay = dateFormatter.dateFromString(oldDatetime)!
        let newDay = dateFormatter.dateFromString(newDatetime)!
        
        //compare if they are the same time with accuracy to minutes
        return userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Minute) == .OrderedSame
        
        //        if userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Minute) == .OrderedSame {
        //            return true
        //        } else {
        //            return newDay.isGreaterThanDate(oldDay)
        //        }
        
    }
    
    func checkIfTimeHasPassed (timeToCheck: String, addFiveMin: Bool = false, format: String = "yyyy-MM-dd HH:mm:ss") -> Bool { //"h:mma"
//        let userCalendar = NSCalendar.currentCalendar()
        dateFormatter.dateFormat = format
//        print("timeToCheck \(timeToCheck)")
        let theTimeToCheck = dateFormatter.dateFromString(timeToCheck)
        let currentTime = NSDate()
//        print("theTimeToCheck \(theTimeToCheck) and currentTime \(currentTime)")
        if addFiveMin { //need to add 5 mins
            theTimeToCheck?.addMins(5)
            return theTimeToCheck!.isGreaterThanDate(currentTime) // return true if time is valid
        } else { //dont add 5 mins
            return theTimeToCheck!.isGreaterThanDate(currentTime) // return true if time is valid
        }
    }
    
    func checkIfDayHasPassed (dayToCheck: NSDate) -> Bool { //2016-03-28 13:00:00 +0000
        let currentDay = NSDate()
        return dayToCheck.isLessThanDate(currentDay) // return true if time is valid
    }
    
    func daysDifference (oldDatetime: String, newDatetime: String, format: String = "M/d/yyyy") -> Int {
        let userCalendar = NSCalendar.currentCalendar()
//        let dateMaker = NSDateFormatter()
//        dateMaker.dateFormat = format
//        let oldDay = dateMaker.dateFromString(oldDatetime)!
//        let newDay = dateMaker.dateFromString(newDatetime)!
        dateFormatter.dateFormat = format
        let oldDay = dateFormatter.dateFromString(oldDatetime)!
        let newDay = dateFormatter.dateFromString(newDatetime)!
        
        //compare if they are the same time with accuracy to minutes
        if userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Day) == .OrderedSame {
            return 0
        } else {
            return userCalendar.components(.Day, fromDate: oldDay, toDate: newDay, options: []).day
        }
        
    }
    
    func isToday (datetime: String, format: String = "M/d/yyyy") -> Bool {
        let userCalendar = NSCalendar.currentCalendar()
        dateFormatter.dateFormat = format
        let dateToCheck = dateFormatter.dateFromString(datetime)!
        let today = NSDate()
        
        //compare if they are the same time with accuracy to minutes
        if userCalendar.compareDate(dateToCheck, toDate: today, toUnitGranularity: .Day) == .OrderedSame {
            return true
        } else {
            return false
        }
        
    }
    
    func prettifyShowdate (dateStr: String, addDay: Bool = false, shortened: Bool = false) -> String{
        //        let dateFormatter = NSDateFormatter()
        //        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.dateFormat = "M/d/yyyy"
        
        let date = dateFormatter.dateFromString(dateStr)
        if addDay {
            if shortened {
                dateFormatter.dateFormat = "dd MMM yyyy, EEE"
            } else {
                dateFormatter.dateFormat = "dd MMM yyyy, EEEE"
            }
        } else {
            dateFormatter.dateFormat = "dd MMM yyyy"
        }
        
        return dateFormatter.stringFromDate(date!)
    }
    
    func prettifyShowdateForStack (dateStr: String) -> [String] {
        dateFormatter.dateFormat = "M/d/yyyy"
        let date = dateFormatter.dateFromString(dateStr)
            
        dateFormatter.dateFormat = "dd MMM"
        let shortDate = dateFormatter.stringFromDate(date!)
            
        dateFormatter.dateFormat = "EEEE"
        let dateDay = dateFormatter.stringFromDate(date!)
            
        return [shortDate,dateDay]
    }
    
    
    // get timeago
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return "\(components.year) years ago"
        } else if (components.year >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month >= 2) {
            return "\(components.month) months ago"
        } else if (components.month >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear) weeks ago"
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day >= 2) {
            return "\(components.day) days ago"
        } else if (components.day >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour >= 2) {
            return "\(components.hour) hours ago"
        } else if (components.hour >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute >= 2) {
            return "\(components.minute) minutes ago"
        } else if (components.minute >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second >= 3) {
            return "\(components.second) seconds ago"
        } else {
            return "Just now"
        }
        
    }
}

// MARK: NSDate extensions

extension NSDate {
    
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
    }
    func isLessThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
    }
    func addDays(daysToAdd : Int) -> NSDate
    {
        let secondsInDays : NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        
        return self.dateByAddingTimeInterval(secondsInDays)
    }
    func addHours(hoursToAdd : Int) -> NSDate
    {
        let secondsInHours : NSTimeInterval = Double(hoursToAdd) * 60 * 60
        
        return self.dateByAddingTimeInterval(secondsInHours)
    }
    func addMins(minsToAdd : Int) -> NSDate
    {
        let secondsInMins : NSTimeInterval = Double(minsToAdd) * 60
        
        return self.dateByAddingTimeInterval(secondsInMins)
    }
    
    
    //http://stackoverflow.com/questions/27182023/getting-the-difference-between-two-nsdates-in-months-days-hours-minutes-seconds
    func yearsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
    }
    func monthsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
    }
    func weeksFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
    }
    func daysFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
    }
    func hoursFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
    }
    func minutesFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
    }
    func secondsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
    }
    func offsetFrom(date:NSDate) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
        return ""
    }
}

//MARK: Color

//extension UIColor {
//    convenience init(red: Int, green: Int, blue: Int) {
//        assert(red >= 0 && red <= 255, "Invalid red component")
//        assert(green >= 0 && green <= 255, "Invalid green component")
//        assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//    }
//
//    convenience init(netHex:Int) {
//        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
//    }
//}

extension UIColor {
    // Usage: UIColor(hex: 0xFC0ACE)
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }
    
    // Usage: UIColor(hex: 0xFC0ACE, alpha: 0.25)
    convenience init(hex: Int, alpha: Double) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255,
            green: CGFloat((hex >> 8) & 0xff) / 255,
            blue: CGFloat(hex & 0xff) / 255,
            alpha: CGFloat(alpha))
    }
}


// MARK: Image Rotating
//ImageRotation.swift

extension UIImage {
    public func imageRotatedByDegrees(degrees: CGFloat, flip: Bool) -> UIImage {
        //        let radiansToDegrees: (CGFloat) -> CGFloat = {
        //            return $0 * (180.0 / CGFloat(M_PI))
        //        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPointZero, size: size))
        let t = CGAffineTransformMakeRotation(degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, rotatedSize.width / 2.0, rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        CGContextScaleCTM(bitmap, yFlip, -1.0)
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


// MARK: Strings Extensions

public enum TruncateMode: Int {
    case Head = 0
    case Middle = 1
    case Tail = 2
}

public extension String {
    func nilIfEmpty() -> String? {
        return self.isEmpty ? nil : self
    }
    
    /// Truncates a string to the max length using the specified mode
    /// :param: maxLength The maximum length (not including any ellipses)
    /// :param: mode The truncation mode; if Middle then ellipses are always added
    /// :param: addEllipses If mode is not middle, controls whether ellipses are added to the truncated end of the string
    func truncateToLength(maxLength: Int, mode: TruncateMode = TruncateMode.Tail, addEllipses: Bool = false) -> String {
        if maxLength <= 0 {
            return ""
        }
        
        //        let ellipses = addEllipses || mode == .Middle ? "\u{2026}" : ""
        let ellipses = addEllipses || mode == .Middle ? "..." : ""
        var headIndex = self.startIndex
        var tailIndex = self.endIndex
        
        if mode == .Head {
            //            tailIndex = advance(self.endIndex, -maxLength, self.startIndex)
            tailIndex = self.endIndex.advancedBy(-maxLength, limit: self.startIndex)
        }
        else if mode == .Tail {
            //            headIndex = advance(self.startIndex, maxLength, self.endIndex)
            headIndex = self.startIndex.advancedBy(maxLength, limit: self.endIndex)
        }
        else {
            let tailLength = maxLength / 2
            let headLength = maxLength - tailLength
            //            headIndex = advance(self.startIndex, headLength, self.endIndex)
            headIndex = self.startIndex.advancedBy(headLength, limit: self.endIndex)
            //            tailIndex = advance(self.endIndex, -tailLength, headIndex)
            tailIndex = self.endIndex.advancedBy(-tailLength, limit: headIndex)
        }
        
        if headIndex == self.startIndex && tailIndex == self.endIndex {
            return self
        }
        
        return self.substringToIndex(headIndex) + ellipses + self.substringFromIndex(tailIndex)
    }
    
    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = dataUsingEncoding(NSUTF8StringEncoding)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}


// MARK: Delaying time

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}


// MARK: Extension to do with numerals

public extension Int {
    /// Returns a random Int point number between 0 and Int.max.
    public static var random:Int {
        get {
            return Int.random(Int.max)
        }
    }
    /**
     Random integer between 0 and n-1.
     
     - parameter n: Int
     
     - returns: Int
     */
    public static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    /**
     Random integer between min and max
     
     - parameter min: Int
     - parameter max: Int
     
     - returns: Int
     */
    public static func random(min: Int, max: Int) -> Int {
        return Int.random(max - min + 1) + min
        //Int(arc4random_uniform(UInt32(max - min + 1))) + min }
    }
}
public extension Double {
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:Double {
        get {
            return Double(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
     Create a random number Double
     
     - parameter min: Double
     - parameter max: Double
     
     - returns: Double
     */
    public static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}
public extension Float {
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:Float {
        get {
            return Float(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
     Create a random num Float
     
     - parameter min: Float
     - parameter max: Float
     
     - returns: Float
     */
    public static func random(min min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
}
public extension CGFloat {
    /// Randomly returns either 1.0 or -1.0.
    public static var randomSign:CGFloat {
        get {
            return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
        }
    }
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:CGFloat {
        get {
            return CGFloat(Float.random)
        }
    }
    /**
     Create a random num CGFloat
     
     - parameter min: CGFloat
     - parameter max: CGFloat
     
     - returns: CGFloat random number
     */
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random * (max - min) + min
    }
}