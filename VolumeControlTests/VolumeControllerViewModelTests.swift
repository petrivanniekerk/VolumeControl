//
//  VolumeControllerViewModelTests.swift
//  VolumeControllerViewModelTests
//
//  Created by Petri van Niekerk on 31/10/2024.
//

import XCTest
@testable import VolumeControl

final class VolumeControllerViewModelTests: XCTestCase {
    
    func testInitialViewModelSetup() {
        let viewModel = VolumeControllerViewModel()
        
        XCTAssertEqual(viewModel.barMaximumValue, 300)
        XCTAssertEqual(viewModel.maximumVolume, 100)
        XCTAssertEqual(viewModel.minimumVolume, 0)
        XCTAssertEqual(viewModel.initialBarValue, 0)
        XCTAssertEqual(viewModel.barValueChange, 0)
        XCTAssertEqual(viewModel.volume, 0)
        XCTAssertEqual(viewModel.lineSettingMaximumValue, 10)
    }
    
    func testSetVolume() {
        let viewModel = VolumeControllerViewModel()
        
        viewModel.setVolumeOnInput(value: 85)
         
        XCTAssertEqual(viewModel.volume, 85.0)
        XCTAssertEqual(viewModel.getVolume(), 85)
    }
    
    func testSetVolumeToMax() {
        let viewModel = VolumeControllerViewModel()
        
        viewModel.setVolumeOnInput(value: 100)
         
        XCTAssertEqual(viewModel.volume, 100.0)
        XCTAssertEqual(viewModel.getVolume(), 100)
    }
    
    func testVolumeNotSetWhenVolumeInputExceedsMax() {
        let viewModel = VolumeControllerViewModel()
        
        viewModel.setVolumeOnInput(value: 101)
         
        XCTAssertEqual(viewModel.volume, 0.0)
        XCTAssertEqual(viewModel.getVolume(), 0)
    }
    
    func testSetVolumeOnLineInput() {
        let viewModel = VolumeControllerViewModel()
        
        viewModel.setVolumeOnLineInput(value: 7)
         
        XCTAssertEqual(viewModel.volume, 70.0)
        XCTAssertEqual(viewModel.getVolume(), 70)
    }
    
    func testSetVolumeOnLineInputMax() {
        let viewModel = VolumeControllerViewModel()
        
        viewModel.setVolumeOnLineInput(value: 10)
         
        XCTAssertEqual(viewModel.volume, 100.0)
        XCTAssertEqual(viewModel.getVolume(), 100)
    }
    
    func testVolumeNotSetWhenLineInputExceedsMax() {
        let viewModel = VolumeControllerViewModel()
        
        viewModel.setVolumeOnLineInput(value: 11)
         
        XCTAssertEqual(viewModel.volume, 0.0)
        XCTAssertEqual(viewModel.getVolume(), 0)
    }
    
    func testSetVolumeWithDragGesture() {
        let viewModel = VolumeControllerViewModel()
        let upDragValue = -200.0 // Simulate upwards drag gesture
        let downDragValue = 100.0 // Simulate downwards drag gesture
        
        viewModel.setVolumeOnDrag(value: upDragValue)
        viewModel.dragDidEnd() // We need to call this simulate that the drag gesture ended
        
        XCTAssertEqual(viewModel.volume.rounded(.up), 67.0)
        XCTAssertEqual(viewModel.getVolume(), 67)
        
        viewModel.setVolumeOnDrag(value: downDragValue)
        viewModel.dragDidEnd() // We need to call this simulate that the drag gesture ended
        
        XCTAssertEqual(viewModel.volume.rounded(.up), 34.0)
        XCTAssertEqual(viewModel.getVolume(), 34)
    }
    
    func testSetVolumeWithDragGestureWhenInputExceedsMax() {
        let viewModel = VolumeControllerViewModel()
        let upDragValue = -301.0 // Simulate upwards over drag gesture as max is 300
        
        viewModel.setVolumeOnDrag(value: upDragValue)
        viewModel.dragDidEnd() // We need to call this simulate that the drag gesture ended
        
        XCTAssertEqual(viewModel.volume.rounded(.up), 100.0)
        XCTAssertEqual(viewModel.getVolume(), 100)
    }
}
