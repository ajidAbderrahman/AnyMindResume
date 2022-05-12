//
//  ContentViewTest.swift
//  Tests iOS
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import XCTest
import ViewInspector
@testable import AnyMindResume

extension ContentView: Inspectable {}

class ContentViewTest: XCTestCase {
    
    func testListExist() {
        let sut = ContentView()
        
        XCTAssertNoThrow(try sut.inspect().navigationView().list(0))
    }
    
    func testListFirstRowStringValue() throws {
        let sut = ContentView()
        let value = try sut.inspect().navigationView().list(0).findAll(ViewType.Text.self)
        
        XCTAssertEqual(try value.first?.string(), "Personal Information")
    }
    
    func testListHasMutipleRows() throws {
        let sut = ContentView()
        let value = try sut.inspect().navigationView().list(0).findAll(ViewType.Text.self)
        
        XCTAssertGreaterThan(value.count, 1)
    }
    
}
