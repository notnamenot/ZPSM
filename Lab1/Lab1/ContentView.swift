//
//  ContentView.swift
//  Lab1
//
//  Created by Student on 12/10/2021.
//
import Alamofire
import SwiftUI
func fetchFilms() {
    // 1
    let request = AF.request("https://swapi.dev/api/films")
    // 2
    request.responseJSON { (data) in
      print(data)
    }
  }
struct ContentView: View {
    var body: some View {
        List {
                Text("A List Item")
                Text("A Second List Item")
                Text("A Third List Item")
            }
        .onAppear(perform: fetchFilms)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
