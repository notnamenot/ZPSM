//
//  ContentView.swift
//  IOSSQLite
//
//  Created by Student on 26/10/2021.
//


import SwiftUI

struct ContentView: View {
    var db = DB()
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                
            Button("Connect to db",action: db.connectToDB)
            Button("create tables", action: db.createTables)
            Button("Fill db", action: db.fillDB)
            Button("drop tables", action: db.deleteTables)
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
