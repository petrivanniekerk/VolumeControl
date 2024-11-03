//
//  VolumeControllerView.swift
//  VolumeControllerView
//
//  Created by Petri van Niekerk on 31/10/2024.
//

import SwiftUI

struct VolumeControllerView: View {
    
    // MARK: - Private Properties
    
    private let volumeControlWidth: CGFloat = 150
    private let spacingBarFraction: CGFloat = 0.05
    private let color: Color = .blue
    
    @StateObject private var viewModel: VolumeControllerViewModel
    
    // MARK: - Initialiser
    
    init(viewModel: VolumeControllerViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        // MARK: - Volume Manual Input Control
        makeVolumeInputView()
        
        // MARK: - Volume Drag Control
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(.gray)
                .opacity(0.5)
                .frame(width: volumeControlWidth, height: viewModel.barMaximumValue)
            Rectangle()
                .fill(color)
                .frame(width: volumeControlWidth, height: viewModel.barValueChange)
            VStack(alignment: .leading) {
                Spacer()
                ForEach(0...8, id: \.self) { _ in
                    Rectangle()
                        .fill(.white)
                        .frame(width: volumeControlWidth, height: viewModel.barMaximumValue * spacingBarFraction)
                    Spacer()
                }
            }
        }
        .padding(.top)
        .frame(width: volumeControlWidth, height: viewModel.barMaximumValue)
        .gesture(
            DragGesture()
                .onChanged {
                    viewModel.setVolumeOnDrag(value: $0.translation.height)
                }
                .onEnded { _ in
                    viewModel.dragDidEnd()
                }
        )
        .clipShape(
            Rectangle()
                .size(CGSize(width: volumeControlWidth, height: viewModel.barMaximumValue))
        )
        
        // MARK: - Volume Setting Display
        Text("Volume set at : \(viewModel.getVolume()) %")
            .accessibilityIdentifier("VolumeController - volumeDisplay")
    }
    
    // MARK: - Private Factory Methods
    
    private func makeVolumeInputView() -> VolumeInputView {
        let maxVolume = Int(viewModel.maximumVolume)
        let minVolume = Int(viewModel.minimumVolume)
        let maxLines = Int(viewModel.lineSettingMaximumValue)
        let minLines = Int(viewModel.minimumVolume)
        
        let viewModel = VolumeInputViewModel(volumeMaxValue: maxVolume,
                                             volumeMinValue: minVolume, 
                                             linesMaxValue: maxLines,
                                             linesMinValue: minLines) { value in
            self.viewModel.setVolumeOnInput(value: value)
        } setLineHandler: { value in
            self.viewModel.setVolumeOnLineInput(value: value)
        }
        
        return VolumeInputView(viewModel: viewModel)
    }
}

// MARK: View Preview

#Preview {
    VolumeControllerView(viewModel: VolumeControllerViewModel())
}
