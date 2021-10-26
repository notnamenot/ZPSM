//
//  ContentView.swift
//  SQLite
//
//  Created by Student on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    var dbHelper = DatabaseHelper()
    
    var body: some View {
        VStack {
            Button("Połączenie z bazą danych", action: dbHelper.ConnectToDatabase)
            Spacer()
            
            Button("Dodanie encji", action: dbHelper.CreateTables)
            Spacer()
            Button("print", action: dbHelper.InsertDataToTables)
            Spacer()
            
            Button("Rozłączenie połączenia z bazą danych", action: dbHelper.DisconnectFromDatabase)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
