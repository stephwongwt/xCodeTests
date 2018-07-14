//
//  LastUpdateDataManager.swift
//  testIncWebServiceTwo
//
//  Created by ITCODE on 28/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import Foundation
import SQLite

class LastUpdateDataManager: DataManagerProtocol {
    static let TABLE_NAME = "incLastUpdate"
    static let table = Table(TABLE_NAME)
    static let lastUpdateId = Expression<Int>("lastUpdateId")
    static let tableName = Expression<String>("tableName")
    static let lastUpdateTime = Expression<NSDate>("lastUpdateTime")
    static let lastCheckTime = Expression<NSDate>("lastCheckTime")
    
    typealias T = LastUpdateItem
    
    static func createTable() throws {
        // creating table
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        do {
            let _ = try DB.run(table.create(ifNotExists: true) { t in
                t.column(lastUpdateId, primaryKey: .Autoincrement)
                t.column(tableName)
                t.column(lastUpdateTime)
                t.column(lastCheckTime)
            })
        } catch _ {
            //table exists
        }
    }
    
    static func insertOne(item: T) throws -> Int64 {
        //inserting one data to table
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        if (item.tableName != nil && item.lastUpdateTime != nil) {
            let insertQuery = table.insert(tableName <- item.tableName!, lastUpdateTime <- item.lastUpdateTime!, lastCheckTime <- item.lastCheckTime!)
            print("insertQuery is \(insertQuery.asSQL())")
            do {
                let rowId = try DB.run(insertQuery)
                guard rowId > 0 else {
                    print("insert error 1")
                    throw DataAccessError.Insert_Error
                }
                return rowId
            } catch _ {
                print("insert error 2")
                throw DataAccessError.Insert_Error
            }
        }
        print("insert error 3")
        throw DataAccessError.Nil_In_Data
    }
    
    static func updateOne(item: T) throws -> Int {
        //updating one existing row with data
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        if (item.lastUpdateId != nil && item.tableName != nil && item.lastUpdateTime != nil) {
            let specificRow = table.filter(lastUpdateId == item.lastUpdateId!)
            let updateQuery = specificRow.update(tableName <- item.tableName!, lastUpdateTime <- item.lastUpdateTime!, lastCheckTime <- item.lastCheckTime!)
            do {
                let rowId = try DB.run(updateQuery)
                guard rowId > 0 else {
                    throw DataAccessError.Insert_Error
                }
                return rowId
            } catch _ {
                throw DataAccessError.Insert_Error
            }
        }
        throw DataAccessError.Nil_In_Data
    }
    
    static func deleteOne(item: T) throws {
        //deleting one data from table
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        let specificRow = table.filter(lastUpdateId == item.lastUpdateId!)
        do {
            let tmp = try DB.run(specificRow.delete())
            guard tmp == 1 else {
                print("query delete item failed 1")
                throw DataAccessError.Delete_Error
            }
        } catch _ {
            print("query delete item failed 2")
            throw DataAccessError.Delete_Error
        }
    }
    
    static func findOne(findLastUpdateId: Int) throws -> T? {
        //deleting one data from table
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        let query = table.filter(lastUpdateId == findLastUpdateId)
        let items = try DB.prepare(query)
        for item in items {
            return LastUpdateItem(lastUpdateId: item[lastUpdateId], tableName: item[tableName], lastUpdateTime: item[lastUpdateTime], lastCheckTime: item[lastCheckTime])
        }
        return nil
    }
    
    static func findOne(findTableName: String) throws -> T? {
        //deleting one data from table
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        let query = table.filter(tableName == findTableName)
        let items = try DB.prepare(query)
        for item in items {
            return LastUpdateItem(lastUpdateId: item[lastUpdateId], tableName: item[tableName], lastUpdateTime: item[lastUpdateTime], lastCheckTime: item[lastCheckTime])
        }
        return nil
    }
    
    static func findAll() throws -> [T]? {
        //get all data
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
        
        var retArray = [T]()
        let items = try DB.prepare(table)
        for item in items {
            retArray.append(LastUpdateItem(lastUpdateId: item[lastUpdateId], tableName: item[tableName], lastUpdateTime: item[lastUpdateTime], lastCheckTime: item[lastCheckTime])!)
        }
        return retArray
    }
    
    static func deleteAll() throws -> Bool {
        //delete data all from table
        
        //open connection
        guard let DB = SQLiteDataStore.sharedInstance.BBDB else {
            throw DataAccessError.Datastore_Connection_Error
        }
//        do {
//            let rows = try DB.prepare(table.count)
            let rows = DB.scalar(table.count)
//            if rows.underestimateCount() > 0 {
            if rows > 0 {
                do {
                    let tmp = try DB.run(table.delete())
                    guard tmp == 1 else {
                        print("query delete all failed 1")
                        throw DataAccessError.Delete_Error
                    }
                    return true
                } catch _ {
                    print("query delete all failed 2")
                    throw DataAccessError.Delete_Error
                }
            } else {
                print("rows count is \(rows)")
                return true
            }
//        } catch {
//            print("did not manager to get table count")
//        }
    }
}






















