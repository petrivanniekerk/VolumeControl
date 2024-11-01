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
        VolumeInputView { text in
            viewModel.setVolumeOnInput(text: text)
        }
        
        // MARK: - Volume Drag Control
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(.gray)
                .opacity(0.5)
                .frame(width: volumeControlWidth, height: viewModel.volumeControlMaxHeight)
            Rectangle()
                .fill(color)
                .frame(width: volumeControlWidth, height: viewModel.volumeControlHeightChange)
            VStack(alignment: .leading) {
                Spacer()
                ForEach(0...8, id: \.self) { _ in
                    Rectangle()
                        .fill(.white)
                        .frame(width: volumeControlWidth, height: viewModel.volumeControlMaxHeight * spacingBarFraction)
                    Spacer()
                }
            }
        }
        .frame(width: volumeControlWidth, height: viewModel.volumeControlMaxHeight)
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
                .size(CGSize(width: volumeControlWidth, height: viewModel.volumeControlMaxHeight))
        )
        
        // MARK: - Volume Setting Display
        Text("Volume set at : \(viewModel.getVolume()) %")
    }
}

// MARK: View Preview

#Preview {
    VolumeControllerView(viewModel: VolumeControllerViewModel())
}