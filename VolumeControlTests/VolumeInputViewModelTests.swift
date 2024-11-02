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
        let sut = VolumeInputViewModel(setVolumeHandler: { _ in }, setLineHandler: { _ in })
        
        XCTAssertEqual(sut.setLineButtonText, "Set Lines")
        XCTAssertEqual(sut.setVolumeButtonText, "Set Volume")
        XCTAssertEqual(sut.setLinePlaceHolderText, "Enter range 0 - 10")
        XCTAssertEqual(sut.setVolumePlaceHolderText, "Enter range 0 - 100")
    }
    
}
