//
//  DataManagerProtocol.swift
//  testIncWebServiceTwo
//
//  Created by ITCODE on 28/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    associatedtype T
    static func createTable() throws -> Void
    static func insertOne(item: T) throws -> Int64
//    static func insertMultiple(items: [T]) throws -> [Int64]
    static func findOne(id: Int) throws -> T?
    static func findAll() throws -> [T]?
    static func updateOne(item: T) throws -> Int
//    static func updateMultiple(items: [T]) throws -> [Int]
    static func deleteOne(item: T) throws -> Void
    static func deleteAll() throws -> Bool
}