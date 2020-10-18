//
//  TodoeyTests.swift
//  TodoeyTests
//
//  Created by Veldanov, Anton on 10/17/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import XCTest

@testable import Todoey


class TodoeyTests: XCTestCase {
    var sut: TodoListViewController!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func setUpWithError() throws {
        sut = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as? TodoListViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testAlert_whenTextFieldValueAdded_returnText(){
        
        
    }
    
    

}
