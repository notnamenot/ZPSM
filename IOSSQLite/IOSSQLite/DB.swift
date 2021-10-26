//
//  DB.swift
//  IOSSQLite
//
//  Created by Student on 26/10/2021.
//

import Foundation

typealias CCharPointer = UnsafeMutablePointer<CChar>

class DB {
    var db: OpaquePointer? = nil
    
    func connectToDB() {
        let documentsDirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let dbURL = documentsDirURL?.appendingPathComponent("demo.db")
        let dbPath = dbURL?.absoluteString
        
        //let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true).[0]
        //let dbFilePath = NSURL(fileURLWithPath: docDir).appendingPathComponent("demo.db")?.path
        
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("ok connected")
        } else {
            print("fail not connected")
        }
    }
    
    func createTables() {
        
        //var msg = ""//= nil
        var zErrMsg:CCharPointer? //= nil//
        
        
        let createTabSensorQry = "create table sensor(sensor_id integer primary key autoincrement, name varchar(30), description varchar(60)); "
        let createTabReadingQry = "create table reading(reading_id integer primary key autoincrement, timestamp timestamp default current_timestamp, value double, sensor_id integer, foreign key(sensor_id) references sensor(sensor_id));"
        
        var res = sqlite3_exec(db, createTabSensorQry, nil, nil, nil)
        print("create sensor res: ",res)
        res = sqlite3_exec(db, createTabReadingQry, nil, nil, nil)
        print("create reading res: ",res)
        //print(zErrMsg)
        //print(msg)
    }
    
    func fillDB() {
        
    }
}
