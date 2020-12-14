//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        Text(car.displayStats())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
