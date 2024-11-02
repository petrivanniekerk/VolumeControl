//
//  VolumeInputView.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 01/11/2024.
//

import SwiftUI

struct VolumeInputView: View {
    
    // MARK: - Private Properties
    
    @FocusState private var volumeFieldIsFocused: Bool
    @StateObject private var viewModel: VolumeInputViewModel
    
    // MARK: - Initialiser
    
    init(viewModel: VolumeInputViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            self.makeNumericVolumeInputView()
            self.makeNumericLineInputView()
        }
        .padding([.leading, .trailing])
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    volumeFieldIsFocused = false
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }
    }
    
    // MARK: - Private Factory Methods
    
    private func makeNumericVolumeInputView() -> NumericInputWithActionButtonView {
        let inputVolumeViewModel = NumericInputWithActionButtonViewModel(placeHolderText: viewModel.setVolumePlaceHolderText,
                                                                         buttonText: viewModel.setVolumeButtonText,
                                                                         completion: viewModel.setVolumeHandler)
        return NumericInputWithActionButtonView(viewModel: inputVolumeViewModel)
    }
    
    private func makeNumericLineInputView() -> NumericInputWithActionButtonView {
        let inputLineViewModel = NumericInputWithActionButtonViewModel(placeHolderText: viewModel.setLinePlaceHolderText,
                                                                       buttonText: viewModel.setLineButtonText,
                                                                       completion: viewModel.setLineHandler)
        return NumericInputWithActionButtonView(viewModel: inputLineViewModel)
    }
}

// MARK: View Preview

#Preview {
    let viewModel = VolumeInputViewModel(setVolumeHandler: { _ in }, setLineHandler: { _ in })
    return VolumeInputView(viewModel: viewModel)
}
