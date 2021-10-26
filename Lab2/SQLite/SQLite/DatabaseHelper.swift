//
//  DatabaseHelper.swift
//  SQLite
//
//  Created by Student on 26/10/2021.
//

import Foundation
import SQLite3

class DatabaseHelper {
    var db: OpaquePointer? = nil
    
    func ConnectToDatabase(){
        // otrzymanie ścieżki do pliku bazy danych
        let documentsDirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let databaseURL = documentsDirURL?.appendingPathComponent("test.db")
        let databasePath = databaseURL?.absoluteString
        print(databasePath ?? "")
        
        // połączenie z bazą danych
        if sqlite3_open(databasePath, &self.db) == SQLITE_OK {
            print("udało się połączyć z bazą SQLite\n")
        } else {
            print("nie udało się połączyć z bazą SQLite\n")
        }
    }
    
    func DisconnectFromDatabase(){
        if sqlite3_close(self.db) == SQLITE_OK {
            print("udało się zamknąć połączenie z bazą SQLite\n")
        } else {
            print("nie udało się zamknąć połączenia z bazą SQLite\n")
        }
    }
    
    func CreateTables(){
        let createSensorTableSQL = "CREATE TABLE sensor (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(50), description VARCHAR(50));"
        sqlite3_exec(self.db, createSensorTableSQL, nil, nil, nil)
        
        let createReadingTableSQL = "CREATE TABLE reading (id INTEGER PRIMARY KEY AUTOINCREMENT, sensor_id INTEGER, timestamp VARCHAR(50), value DOUBLE, FOREIGN KEY(sensor_id) REFERENCES sensor(id));"
        sqlite3_exec(self.db, createReadingTableSQL, nil, nil, nil)
    }
    
    func InsertDataToTables(){
        if let localData = readLocalFile(forName: "sensors") {
            parse(jsonData: localData)
        }
        // https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
        // https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
    }
}
