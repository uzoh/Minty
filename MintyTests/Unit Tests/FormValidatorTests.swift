//
//  FormValidatorTests.swift
//  MintyTests
//
//  Created by Uzoh Okwara on 14/03/2022.
//

import XCTest
@testable import Minty

class FormValidatorTests: XCTestCase {

    func testValidPhoneNumber() {
        // given
        let phone = "08130366273"
        
        // When
        let error = FormValidator.validPhone(phone)
        
        // Then
        XCTAssertNil(error)
    }
    
    func testValidPhoneNumberWith234Format() {
        // given
        let phone = "+2348130366273"
        
        // When
        let error = FormValidator.validPhone(phone)
        
        // Then
        XCTAssertNil(error)
    }
    
    func testInvalidPhoneNumber() {
        // given
        let phone = "081303606273"
        
        // When
        let error = FormValidator.validPhone(phone)
        
        // Then
        XCTAssertEqual(error?.localizedDescription, FormError.invalidPhone.localizedDescription)
    }
    
    func testValidPassword() {
        // given
        let password = "password"
        //when
        let error = FormValidator.validPassword(password)
        //then
        XCTAssertNil(error)
    }
    
    func testInvalidPassword() {
        //given
        let password = "passwordd"
        //when
        let error = FormValidator.validPassword(password)
        //then
        XCTAssertNil(error)
    }
}
