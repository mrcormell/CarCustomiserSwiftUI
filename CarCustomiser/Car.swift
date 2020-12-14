//
//  Car.swift
//  CarCustomiser
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    let acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)mph
            Acceleration (0-60 in): \(acceleration)s
            Handling: \(handling)
            """
    }
}
