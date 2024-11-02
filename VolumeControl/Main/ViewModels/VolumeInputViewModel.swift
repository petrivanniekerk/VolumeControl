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
    
    let setVolumeHandler: (Int) -> Void
    let setLineHandler: (Int) -> Void
    
    // MARK: - Initialiser
    
    init(setVolumeHandler: @escaping (Int) -> Void, setLineHandler: @escaping (Int) -> Void) {
        self.setVolumeHandler = setVolumeHandler
        self.setLineHandler = setLineHandler
    }
}
