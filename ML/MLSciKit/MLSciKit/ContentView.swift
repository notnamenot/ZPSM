//
//  ContentView.swift
//  MLSciKit
//
//  Created by Student on 09/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    var cena: Double = 0.0;
    
//    let model = RandomForestPassatPriceUsd()
    
    var paliwa = ["gasoline", "diesel", "gas", "hybrid-petrol"]
    
//    @State private var selectedPaliwo = "gas"
    
    @State private var przebieg = 1000.0 //odometer_value
    @State private var rok = 1950.0 // year_produced
    
    @State private var paliwo = "diesel"// engine_fuel
    
    @State private var silnik = 1.0 // engine_capacity
    
    @State private var isEditing = false
    

    func getPrice() {
//        let defaultConfig = MLModelConfiguration()
//        guard let model = try? RandomForestPassatPriceUsd(
//        configuration: defaultConfig) else {
//        fatalError("Could not create model.") }
    }
    
    
    var body: some View {
        VStack{
            
            HStack{
                Text("Przebieg: ")
                Spacer()
                Slider(
                    value: $przebieg,
                    in: 0...1000000,
                    step: 500,
                    onEditingChanged: { editing in isEditing=editing}
                )
                Text(String(format: " %.0f", przebieg))
            }.padding()
            
            HStack{
                Text("Rok produkcji: ")
                Spacer()
                Slider(
                    value: $rok,
                    in: 1980...2020,
                    step: 1,
                    onEditingChanged: { editing in isEditing=editing}
                )
                Text(String(format: " %.0f", rok))
            }.padding()

            
            HStack{
                Text("Poj. silnika: ")
                Spacer()
                Slider(
                    value: $silnik,
                    in: 0.5...4,
                    step: 0.01,
                    onEditingChanged: { editing in isEditing=editing}
                )
                Text(String(format: " %.2f", silnik))
            }.padding()
            
            
            HStack{
                Text("Rodzaj paliwa: ")
                Spacer()
                Picker("Choose paliwo", selection: $paliwo) {
                    ForEach(paliwa, id: \.self) {
                        p in Text(p.capitalized).tag(p)
                    }
                }.pickerStyle(.segmented)
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
