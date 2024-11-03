//
//  VolumeInputViewModel.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import Foundation

final class VolumeInputViewModel: ObservableObject {
    
    // MARK: - Internal Properties
    
    let setVolumeButtonText = "Set Volume"
    let setVolumePlaceHolderText = "Enter range 0 - 100"
    
    let setLineButtonText = "Set Lines"
    let setLinePlaceHolderText = "Enter range 0 - 10"
    
    let volumeErrorMessage = "Please enter value between 0 - 100"
    let linesErrorMessage = "Please enter value between 0 - 10"
    
    let volumeMaxValue: Int
    let linesMaxValue: Int
    let setVolumeHandler: (Int) -> Void
    let setLineHandler: (Int) -> Void
    
    // MARK: - Initialiser
    
    init(volumeMaxValue: Int,
         linesMaxValue: Int,
         setVolumeHandler: @escaping (Int) -> Void,
         setLineHandler: @escaping (Int) -> Void) {
        self.setVolumeHandler = setVolumeHandler
        self.setLineHandler = setLineHandler
        self.volumeMaxValue = volumeMaxValue
        self.linesMaxValue = linesMaxValue
    }
}
