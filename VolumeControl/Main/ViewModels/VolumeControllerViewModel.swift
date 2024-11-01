//
//  VolumeControllerViewModel.swift
//  VolumeControllerViewModel
//
//  Created by Petri van Niekerk on 01/11/2024.
//

import Foundation

final class VolumeControllerViewModel: ObservableObject {

    // MARK: - Internal Properties
    
    let volumeControlMaxHeight: CGFloat = 300
    let hundredPercentVolume: Double = 100
    
    // MARK: - Private Set Internal Properties
    
    @Published private(set) var initialVolume: CGFloat = 0
    @Published private(set) var volumeControlHeightChange: CGFloat = 0
    @Published private(set) var volume: Double = 0
    
    // MARK: - Internal Methods
    
    func setVolumeOnInput(text: String) {
        let filteredText = text.filter { $0.isNumber }
        if let doubleValue = Double(filteredText) {
            volume = CGFloat(doubleValue)
            volumeControlHeightChange = volumeControlMaxHeight * (volume/hundredPercentVolume)
            
            setToMaximumVolumeIfNeeded()
            initialVolume = volumeControlHeightChange
        }
    }
    
    func setVolumeOnDrag(value: CGFloat) {
        volumeControlHeightChange = max(0, initialVolume - value)
        volume = Double(volumeControlHeightChange) / volumeControlMaxHeight * hundredPercentVolume
        
        setToMaximumVolumeIfNeeded()
    }
    
    func dragDidEnd() {
        initialVolume = volumeControlHeightChange
    }
    
    func getVolume() -> Int {
        Int(volume.rounded(.up))
    }
    
    // MARK: - Private Methods
    
    private func setToMaximumVolumeIfNeeded() {
        if volumeControlHeightChange > volumeControlMaxHeight {
            volumeControlHeightChange = volumeControlMaxHeight
            volume = hundredPercentVolume
        }
    }
}
