//
//  JsonClasses.swift
//  SQLite
//
//  Created by Student on 26/10/2021.
//

import Foundation
import SwiftUI
struct Sensor: Codable {
    let id: Int
    //let name: String
    let description: String
}

struct Reading: Codable {
    let id: Int
    let sensorId: Int
    let timestamp: String
    let value: Double
}

public func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}

public func parse(jsonData: Data) {
    do {
        print(jsonData.count)
        let local = try JSONDecoder().decode(Sensor.self,
                                                   from: jsonData)
        print(local)
        
    } catch {
        print("decode error")
    }
}
