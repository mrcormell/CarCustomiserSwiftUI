//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    let starterCars: StarterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if oldValue >= starterCars.cars.count - 1 {
                selectedCar = 0
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(starterCars.cars[selectedCar].displayStats())
            Button("Next Car", action: {
                selectedCar += 1
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
