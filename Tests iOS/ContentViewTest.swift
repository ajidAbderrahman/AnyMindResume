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
    
    func test_Content_hasList() {
        let sut = ContentView()
        
        XCTAssertNoThrow(try sut.inspect().list())
    }
    
    func testStringValue() throws {
        let sut = ContentView()
        let value = try sut.inspect().list().text(0).string()
        XCTAssertEqual(value, "Personal Information")
    }
    
}
