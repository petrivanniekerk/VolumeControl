//
//  VolumeInputViewModelTests.swift
//  VolumeControlTests
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import XCTest
@testable import VolumeControl

final class VolumeInputViewModelTests: XCTestCase {

    func testViewModelSetup() {
        let sut = VolumeInputViewModel(volumeMaxValue: 100,
                                       linesMaxValue: 10,
                                       setVolumeHandler: { _ in },
                                       setLineHandler: { _ in })
        
        XCTAssertEqual(sut.setLineButtonText, "Set Lines")
        XCTAssertEqual(sut.setVolumeButtonText, "Set Volume")
        XCTAssertEqual(sut.setLinePlaceHolderText, "Enter range 0 - 10")
        XCTAssertEqual(sut.setVolumePlaceHolderText, "Enter range 0 - 100")
        XCTAssertEqual(sut.volumeErrorMessage, "Please enter value between 0 - 100")
        XCTAssertEqual(sut.linesErrorMessage, "Please enter value between 0 - 10")
    }
    
}
