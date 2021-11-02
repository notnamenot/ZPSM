//
//  JSONHelper.swift
//  IOSSQLite
//
//  Created by Student on 26/10/2021.
//

import Foundation


struct Sensor: Codable {
    let id: String //id
    let description: String
}

struct Reading: Codable {
    let sensor_id: String //sensor Id
    let timestamp: String
    let value: Double
}


func getSensorData() -> ([Sensor]){
    let urlString = "https://home.agh.edu.pl/~ernst/zpsm/sensors.json"
    
    var res: [Sensor] = []
    if let url = URL(string: urlString) {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                 res = try JSONDecoder().decode([Sensor].self, from: data)
                 print("OK - sensors read")
              } catch let error {
                 print(error)
              }
           }
       }.resume()
    }
    return res
}

func getReadingsData() -> ([Reading]){
    let urlString = "https://home.agh.edu.pl/~ernst/zpsm/readings-10.json"
    
    var res: [Reading] = []
    if let url = URL(string: urlString) {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                 res = try JSONDecoder().decode([Reading].self, from: data)
                 print("OK - sensors read")
              } catch let error {
                 print(error)
              }
           }
       }.resume()
    }
    return res
    
}
