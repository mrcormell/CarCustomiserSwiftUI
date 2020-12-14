//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Cormell, David - DPC on 14/12/2020.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        //arrange
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (Cost: 500)"]/*[[".cells[\"Exhaust Package (Cost: 500)\"].switches[\"Exhaust Package (Cost: 500)\"]",".switches[\"Exhaust Package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package (Cost: 500)"]/*[[".cells[\"Tires Package (Cost: 500)\"].switches[\"Tires Package (Cost: 500)\"]",".switches[\"Tires Package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        //assert
        XCTAssertEqual(tablesQuery.switches["Drivetrain Package (Cost: 500)"].isEnabled, false)
        XCTAssertEqual(tablesQuery.switches["ECU & Fuel Package (Cost: 1000)"].isEnabled, false)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
