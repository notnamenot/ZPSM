//
//  JSONHelper.swift
//  IOSSQLite
//
//  Created by Student on 26/10/2021.
//

import Foundation


struct Sensor: Codable {
    let id: Int
    let name: String
    let description: String
}

struct Reading: Codable {
    let id: Int
    let sensorId: Int
    let timestamp: String
    let value: Double
}
