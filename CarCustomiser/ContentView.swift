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
    @State private var remainingFunds = 750

    var exhaustPackageEnabled: Bool {
        if exhaustPackage == true {
            return true
        } else {
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        }
    }
    
    var tiresPackageEnabled: Bool {
        if tiresPackage == true {
            return true
        } else {
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        }
    }
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            })
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            })
        
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                }
                Section {
                    Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                }

            }
            Text("Remaining Funds: \(remainingFunds)")
                .baselineOffset(20)
                .foregroundColor(.red)
        }
    }
    
    func resetDisplay() {
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        starterCars = StarterCars()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
