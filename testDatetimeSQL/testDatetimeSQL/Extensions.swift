//
//  Extensions.swift
//  testIncWebServiceTwo
//
//  Created by ITCODE on 28/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import Foundation
import SQLite

extension NSDate {
    class var declaredDatatype: String {
        print("declared data type")
        return String.declaredDatatype
    }
    class func fromDatatypeValue(stringValue: String) -> NSDate {
        print("date from string \(stringValue)")
//        SQLDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return SQLDateFormatter.dateFromString(stringValue)!
    }
    var datatypeValue: String {
        print("string from date \(self)")
//        SQLDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        return SQLDateFormatter.stringFromDate(self)
    }
}

let SQLDateFormatter: NSDateFormatter = {
    let formatter = NSDateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
//    formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
    formatter.timeZone = NSTimeZone(name: "Asia/Singapore")
    return formatter
}()