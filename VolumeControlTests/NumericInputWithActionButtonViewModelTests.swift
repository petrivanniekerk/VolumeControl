//
//  NumericInputWithActionButtonViewModelTests.swift
//  VolumeControlTests
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import XCTest
@testable import VolumeControl

final class NumericInputWithActionButtonViewModelTests: XCTestCase {
    
    func testButtonPressWithValidEntry() {
        let expectation = XCTestExpectation(description: "Action button pressed")
        
        let sut = NumericInputWithActionButtonViewModel(placeHolderText: "",
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
        
        let sut = NumericInputWithActionButtonViewModel(placeHolderText: "",
                                                        buttonText: "") { value in
            assert(value == 2)
            expectation.fulfill()
        }
        
        sut.input = "invalid"
        sut.buttonPress()
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testButtonPressWithNumericAndTextValuesFiltersToNumericValue() {
        let expectation = XCTestExpectation(description: "Action button pressed")
        
        let sut = NumericInputWithActionButtonViewModel(placeHolderText: "",
                                                        buttonText: "") { value in
            assert(value == 52)
            expectation.fulfill()
        }
        
        sut.input = "in5vali2d"
        sut.buttonPress()
        
        wait(for: [expectation], timeout: 2)
    }
}
