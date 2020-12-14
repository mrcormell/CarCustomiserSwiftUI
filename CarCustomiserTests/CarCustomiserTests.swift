//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {
    func testCarGetStatsAsPerPropertyValues() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 125mph
        Acceleration (0-60 in): 7.7s
        Handling: 5
        """
        //arrange
        let actual = car.displayStats()
        //assert
        XCTAssertEqual(actual, expected)
    }

}
