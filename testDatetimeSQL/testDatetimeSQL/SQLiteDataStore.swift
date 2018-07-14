//
//  SQLiteDataStore.swift
//  AlamofireSwiftyJsonSQLiteSample
//
//  Created by ITCODE on 21/12/15.
//  Copyright © 2015 incinemas. All rights reserved.
//

import Foundation
import SQLite

enum DataAccessError: ErrorType {
    case Datastore_Connection_Error
    case Insert_Error
    case Delete_Error
    case Search_Error
    case Nil_In_Data
}

class SQLiteDataStore {
    static let sharedInstance = SQLiteDataStore()
    let BBDB: Connection?
    
    private init() {
        var path = "test.sqlite"
        
        if let dirs: [NSString] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [NSString] {
            let dir = dirs[0]
            path = dir.stringByAppendingPathComponent("test.sqlite")
//            print(path)
        }
        
        do {
            BBDB = try Connection (path)
        } catch _ {
            BBDB = nil
        }
    }
    
    func createTables () throws {
        //try to create permenant store tables
        do {
            try LastUpdateDataManager.createTable()
        } catch {
            throw DataAccessError.Datastore_Connection_Error
        }
    }
}