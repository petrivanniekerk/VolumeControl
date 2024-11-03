//
//  NumericInputViewModelTests.swift
//  VolumeControlTests
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import XCTest
@testable import VolumeControl

final class NumericInputViewModelTests: XCTestCase {
    
    func testButtonPressWithValidEntry() {
        let expectation = XCTestExpectation(description: "Action button pressed")
        
        let sut = NumericInputViewModel(placeHolderText: "",
                                        buttonText: "") { value in
            assert(value == 5)
            expectation.fulfill()
        }
        
        sut.input = "5"
        sut.buttonPress()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testButtonPressWithInvalidEntry() {
        let expectation = XCTestExpectation(description: "Action button pressed")
        expectation.isInverted = true
        
        let sut = NumericInputViewModel(placeHolderText: "",
                                        buttonText: "") { value in
            assert(value == 2)
            expectation.fulfill()
        }
        
        sut.input = "invalid"
        sut.buttonPress()
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testButtonPressWithValueRangeDefined() {
        let lowerLimitExceededExpectation = XCTestExpectation(description: "Action button pressed when value below lower limit")
        let upperLimitExceededExpectation = XCTestExpectation(description: "Action button pressed when value above upper limit")
        lowerLimitExceededExpectation.isInverted = true
        upperLimitExceededExpectation.isInverted = true
        
        let sut = NumericInputViewModel(placeHolderText: "",
                                        buttonText: "",
                                        minimumValue: 0,
                                        maximumValue: 10) { value in
            lowerLimitExceededExpectation.fulfill()
            upperLimitExceededExpectation.fulfill()
        }
        
        sut.input = "-1"
        sut.buttonPress()
        
        sut.input = "11"
        sut.buttonPress()
        
        wait(for: [lowerLimitExceededExpectation, upperLimitExceededExpectation], timeout: 2)
    }
}
