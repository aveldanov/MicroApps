//
//  IntuNotItTests.swift
//  IntuNotItTests
//
//  Created by Veldanov, Anton on 10/31/20.
//

import XCTest
@testable import IntuNotIt

class IntuNotItTests: XCTestCase {
    var sut: ItemsTableViewController!
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ItemsTableViewController") as! ItemsTableViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testItemsDownload_AsyncOperation() throws {
        guard let url = URL(string: ItemManager.shared.urlFeed) else {
            XCTFail();return
        }
        let sessionAnsweredExpectation = expectation(description: "Session")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                XCTFail(error.localizedDescription)
            }
            
            if let data = data{
                
                guard let itemList = try? JSONDecoder().decode([Item].self, from: data) else{
                    XCTFail()
                    return
                }
                
                sessionAnsweredExpectation.fulfill()
                XCTAssertEqual(itemList.count, 30)
                
            }
            
            
        }.resume()
        
        waitForExpectations(timeout: 8, handler: nil)
    }
}
