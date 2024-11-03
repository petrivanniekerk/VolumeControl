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
    let lineSettingMaximumValue: Double = 10
    
    // MARK: - Private Set Internal Properties
    
    @Published private(set) var initialBarValue: CGFloat = 0
    @Published private(set) var barValueChange: CGFloat = 0
    @Published private(set) var volume: Double = 0
    
    // MARK: - Internal Methods
    
    func setVolumeOnInput(value: Int) {
        self.manualInputHandling(inputValue: value, maximumValue: maximumVolume) { volumeSetting in
            barValueChange = barMaximumValue * (volumeSetting / maximumVolume)
            volume = volumeSetting
        }
    }
    
    func setVolumeOnLineInput(value: Int) {
        self.manualInputHandling(inputValue: value, maximumValue: lineSettingMaximumValue) { volumeSetting in
            let scaledUpVolumeSetting = volumeSetting * lineSettingMaximumValue
            barValueChange = barMaximumValue * (scaledUpVolumeSetting / maximumVolume)
            volume = scaledUpVolumeSetting
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
    
    private func manualInputHandling(inputValue: Int, maximumValue: Double, handlingStrategy: (Double) -> Void) {
        let volumeSetting = Double(inputValue)
        
        if volumeSetting > maximumValue { return }
        
        handlingStrategy(volumeSetting)
        initialBarValue = barValueChange
    }
}
