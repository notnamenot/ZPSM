//
//  ContentView.swift
//  CW1_CocoaPods
//
//  Created by Student on 12/10/2021.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button("Title") {
                AF.request("http://httpbin.org/uuid")
                    .response {
                        response in debugPrint(response)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
