//
//  SmartShopperTests.swift
//  SmartShopperTests
//
//  Created by Veldanov, Anton on 10/3/20.
//

import XCTest

class SmartShopperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetHours_whenInput_shouldReturnRoundedUpHours(){
        
        XCTAssert(Income.getHours(forIncome: 25, andPrice: 100) == 4)
        XCTAssert(Income.getHours(forIncome: 15.50, andPrice: 250.53) == 17) // ceil of 16.3

    }



}
