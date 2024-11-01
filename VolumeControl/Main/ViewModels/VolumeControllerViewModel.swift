//
//  VolumeControllerViewModel.swift
//  VolumeControllerViewModel
//
//  Created by Petri van Niekerk on 01/11/2024.
//

import Foundation

final class VolumeControllerViewModel: ObservableObject {

    // MARK: - Internal Properties
    
    let barMaximumValue: CGFloat = 300
    let maximumVolume: Double = 100
    
    // MARK: - Private Set Internal Properties
    
    @Published private(set) var initialBarValue: CGFloat = 0
    @Published private(set) var barValueChange: CGFloat = 0
    @Published private(set) var volume: Double = 0
    
    // MARK: - Internal Methods
    
    func setVolumeOnInput(text: String) {
        let filteredText = text.filter { $0.isNumber }
        if let doubleValue = Double(filteredText) {
            let volumeSetting = CGFloat(doubleValue)
            if volumeSetting > barMaximumValue {
                setToMaximum()
            } else {
                barValueChange = barMaximumValue * (volumeSetting/maximumVolume)
                volume = volumeSetting
            }
            
            initialBarValue = barValueChange
        }
    }
    
    func setVolumeOnDrag(value: CGFloat) {
        let volumeBarChange = max(0, initialBarValue - value)
        
        if volumeBarChange > barMaximumValue {
            setToMaximum()
        } else {
            barValueChange = volumeBarChange
            volume = Double(volumeBarChange) / barMaximumValue * maximumVolume
        }
    }
    
    func dragDidEnd() {
        initialBarValue = barValueChange
    }
    
    func getVolume() -> Int {
        Int(volume.rounded(.up))
    }
    
    // MARK: - Private Methods
    
    private func setToMaximum() {
        barValueChange = barMaximumValue
        volume = maximumVolume
    }
}
