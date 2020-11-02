//
//  IntuNotItUITests.swift
//  IntuNotItUITests
//
//  Created by Veldanov, Anton on 10/31/20.
//

import XCTest

class IntuNotItUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil

    }

    
    func testItemDetail_WhenTapped_NextVCLoads(){

        app.children(matching: .window).firstMatch.tap()
        
//        XCTAssertTrue(app.staticTexts["nameLabel"].waitForExistence(timeout: 15))
//        XCTAssertEqual(app.staticTexts.element.label, "nameLabel")
        
        XCTAssertTrue(app.staticTexts["nameLabel"].exists)
    }

}
