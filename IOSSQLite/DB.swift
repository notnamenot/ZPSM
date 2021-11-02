//
//  DB.swift
//  IOSSQLite
//
//  Created by Student on 26/10/2021.
//

import Foundation

typealias CCharPointer = UnsafeMutablePointer<CChar>

let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)

class DB {
    var db: OpaquePointer? = nil
    //var JSON: JSONHelper = nil
    //var stmt: OpaquePointer? = nil
    var stmt: OpaquePointer? = nil
    
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
        
        
        let createTabSensorQry = "create table sensor(id varchar(10) primary key, description varchar(60)); "
        let createTabReadingQry = "create table reading(timestamp timestamp, value double, sensor_id varchar(10), primary key (sensor_id, timestamp, value),foreign key(sensor_id) references sensor(id));"
        
        var res = sqlite3_exec(db, createTabSensorQry, nil, nil, nil)
        print("create sensor res: ",res)
        res = sqlite3_exec(db, createTabReadingQry, nil, nil, nil)
        print("create reading res: ",res)

    }
    
    func deleteTables() {
        let deleteTablesQry = "drop table sensor; drop table reading;"
        var res = sqlite3_exec(db, deleteTablesQry, nil, nil, nil)
        print("drop tables res: ",res)
    }
    
    func fillDB() {
        //JSONHelper = JSONHelper()
        let sensors = getSensorData()
        let readings = getReadingsData()
    
        let insertSensorsStmt = "insert into sensors values (?, ?);"
    
        var rc = sqlite3_prepare_v2(self.db, insertSensorsStmt, -1, &stmt, nil)
            //Int32(insertSensorsStmt.count) za -1
        
        if (rc != 0) {
            print("error preparing")
            print(sqlite3_errmsg(self.db) as Any)
            return
        }
        for s in sensors {
            let a = s.id as String
            let b = s.description as String
//            sqlite3_bind_text(self.stmt, 1, String(s.id), -1, SQLITE_TRANSIENT)
//            sqlite3_bind_text(self.stmt, 2, String(s.description),-1, SQLITE_TRANSIENT)
            sqlite3_bind_text(self.stmt, 1, a, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(self.stmt, 2, b, -1, SQLITE_TRANSIENT)
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            print("error inserting")
            sqlite3_close(db)
            return
        }
//        sqlite3_finalize(statement)
        // https://stackoverflow.com/questions/7342067/how-to-insert-an-array-into-a-sqlite-database transakcja
        // https://www.raywenderlich.com/6620276-sqlite-with-swift-tutorial-getting-started tutorial
        
        //https://stackoverflow.com/questions/28142226/sqlite-for-swift-is-unstable halp
    }
}
