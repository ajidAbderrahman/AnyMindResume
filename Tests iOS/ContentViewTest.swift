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
    
    func testStringValue() throws {
        let sut = ContentView()
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "Hello, world!")
    }
    
}
