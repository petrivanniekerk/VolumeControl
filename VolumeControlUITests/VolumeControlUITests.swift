//
//  VolumeControlUITests.swift
//  VolumeControlUITests
//
//  Created by Petri van Niekerk on 31/10/2024.
//

import XCTest

final class VolumeControlUITests: XCTestCase {

    func testVolumeInputView() throws {
        let app = XCUIApplication()
        app.launch()

        let volumeInput = app.textFields["VolumeInputView - volumeInput"]
        let volumeUpdateButton = app.buttons["VolumeInputView - volumeInput"]
        let valueDisplay = app.staticTexts["VolumeController - volumeDisplay"]
        let lineInput = app.textFields["VolumeInputView - lineInput"]
        let lineUpdateButton = app.buttons["VolumeInputView - lineInput"]
        
        XCTAssertTrue(volumeInput.exists)
        XCTAssertTrue(volumeUpdateButton.exists)
        XCTAssertTrue(lineInput.exists)
        XCTAssertTrue(lineUpdateButton.exists)
        XCTAssertTrue(valueDisplay.exists)
        
        volumeInput.tap()
        volumeInput.typeText("50")
        volumeUpdateButton.tap()
        
        XCTAssertEqual(valueDisplay.label, "Volume set at : 50 %")
        
        lineInput.tap()
        lineInput.typeText("2")
        lineUpdateButton.tap()
        
        XCTAssertEqual(valueDisplay.label, "Volume set at : 20 %")
    }
}
