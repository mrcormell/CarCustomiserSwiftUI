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
    @State private var driveTrainPackage = false
    @State private var ecuFuelPackage = false
    @State private var nextCarButton = true
    @State private var remainingFunds = 1000
    @State private var timeRemaining = 30
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var exhaustPackageEnabled: Bool {
        if timeRemaining <= 0 {
            return false
        } else if exhaustPackage == true {
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
        if timeRemaining <= 0 {
            return false
        } else if tiresPackage == true {
            return true
        } else {
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        }
    }
    
    var driveTrainPackageEnabled: Bool {
        if timeRemaining <= 0 {
            return false
        } else if driveTrainPackage == true {
            return true
        } else {
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        }
    }
    
    var ecuFuelPackageEnabled: Bool {
        if timeRemaining <= 0 {
            return false
        } else if ecuFuelPackage == true {
            return true
        } else {
            if remainingFunds >= 1000 {
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
                    starterCars.cars[selectedCar].acceleration -= 1
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 1
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
        
        let driveTrainPackageBinding = Binding<Bool> (
            get: { self.driveTrainPackage },
            set: { newValue in
                self.driveTrainPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            })
        
        let ecuFuelPackageBinding = Binding<Bool> (
            get: { self.ecuFuelPackage },
            set: { newValue in
                self.ecuFuelPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 3
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 3
                    starterCars.cars[selectedCar].acceleration += 1.5
                    remainingFunds += 1000
                }
            })
        
        VStack {
            Text("\(timeRemaining)")
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        nextCarButton = false
                    }
                }
                .foregroundColor(.red)
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                    .disabled(!nextCarButton)
                }
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Drivetrain Package (Cost: 500)", isOn: driveTrainPackageBinding)
                        .disabled(!driveTrainPackageEnabled)
                    Toggle("ECU & Fuel Package (Cost: 1000)", isOn: ecuFuelPackageBinding)
                        .disabled(!ecuFuelPackageEnabled)
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
        driveTrainPackage = false
        ecuFuelPackage = false
        starterCars = StarterCars()
    }
    
    func lockDisplay() {
        nextCarButton = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
