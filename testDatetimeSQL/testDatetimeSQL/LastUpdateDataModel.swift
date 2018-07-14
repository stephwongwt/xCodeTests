//
//  LastUpdateDataModel.swift
//  testIncWebServiceTwo
//
//  Created by ITCODE on 28/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import Foundation

class LastUpdateItem {
    var lastUpdateId: Int?
    var tableName: String?
    var lastUpdateTime: NSDate?
    var lastCheckTime: NSDate?
    
    init? (lastUpdateId: Int, tableName: String, lastUpdateTime: NSDate, lastCheckTime: NSDate) {
        self.lastUpdateId = lastUpdateId
        self.tableName = tableName
        self.lastUpdateTime = lastUpdateTime
        self.lastCheckTime = lastCheckTime
        
        // if any of the fields are empty, it will cancel initialization of object
        if tableName.isEmpty {
            return nil
        }
    }
    
    func getLastUpdateId () -> Int {
        return lastUpdateId!
    }
    func getTableName () -> String {
        return tableName!
    }
    func getLastUpdateTime () -> NSDate {
        return lastUpdateTime!
    }
    func getLastCheckTime () -> NSDate {
        return lastCheckTime!
    }
}