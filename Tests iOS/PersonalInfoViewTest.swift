//
//  PersonalInfoViewTest.swift
//  Tests iOS
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import XCTest
import ViewInspector
@testable import AnyMindResume

extension PersonalInfoView: Inspectable {}

class PersonalInfoViewTest: XCTestCase {

    func testStringValue() throws {
        let sut = PersonalInfoView()
        
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "Hello, World!")
    }

}
