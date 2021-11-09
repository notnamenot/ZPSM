//
//  ContentView.swift
//  MLSciKit
//
//  Created by Student on 09/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    var przebieg = 0.0;
    var rok = 1999;
    var silnik = 1.2;
    var paliwo = "diesel";
    var cena = 0.0;
    
    var body: some View {
        VStack{
            HStack{
                Text("Przebieg: ")
                Spacer()
                //Slider()
            }.padding()
            HStack{
                Text("Rok produkcji: ")
                Spacer()
                //Slider()
            }.padding()
            HStack{
                Text("Pojemność silnika: ")
                Spacer()
                //Slider()
            }.padding()
            HStack{
                Text("Rodzaj paliwa: ")
                Spacer()
                //Picker()
            }.padding()
            HStack{
                Text("Cena:")
                Text( String(format: " %.2f", "\(cena)"))

            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
