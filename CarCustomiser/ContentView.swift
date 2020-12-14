//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars: StarterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if oldValue >= starterCars.cars.count - 1 {
                selectedCar = 0
            }
        }
    }
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            })
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            })
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(starterCars.cars[selectedCar].displayStats())
                Button("Next Car", action: {
                    selectedCar += 1
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tires Package", isOn: tiresPackageBinding)
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
