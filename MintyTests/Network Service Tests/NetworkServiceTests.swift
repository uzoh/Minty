//
//  NetworkServiceTests.swift
//  MintyTests
//
//  Created by Uzoh Okwara on 14/03/2022.
//

import XCTest
@testable import Minty

class NetworkServiceTests: XCTestCase {
    
    func testValidLoginCredentials() {
        // Given
        let phone = "08130000000"
        let password = "password"
        
        let task = XCTestExpectation()
        var result = false
        
        // When
        NetworkService.shared.login(phone: phone, password: password) { success in
            result = success
            task.fulfill()
        }
        
        // Then
        wait(for: [task], timeout: 5)
        XCTAssertTrue(result)
    }

    func testInvalidLoginCredentials() {
        // Given
        let phone = "081300000000"
        let password = "password"
        
        let task = XCTestExpectation()
        var result = false
        
        // When
        NetworkService.shared.login(phone: phone, password: password) { success in
            result = success
            task.fulfill()
        }
        
        // Then
        wait(for: [task], timeout: 5)
        XCTAssertFalse(result)
    }
}
