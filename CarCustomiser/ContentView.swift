//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    let starterCars: StarterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            Text(starterCars.cars[selectedCar].displayStats())
            Button("Random Car", action: {
                selectedCar = Int.random(in: 0 ..< self.starterCars.cars.count)
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
