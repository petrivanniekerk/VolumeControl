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
    @FocusState private var lineFieldIsFocused: Bool
    @StateObject private var viewModel: VolumeInputViewModel
    
    // MARK: - Initialiser
    
    init(viewModel: VolumeInputViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            self.makeNumericVolumeInputView()
                .focused($volumeFieldIsFocused)
            self.makeNumericLineInputView()
                .focused($lineFieldIsFocused)
        }
        .padding([.leading, .trailing])
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    if volumeFieldIsFocused == true { volumeFieldIsFocused.toggle() }
                    if lineFieldIsFocused == true { lineFieldIsFocused.toggle() }
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }
    }
    
    // MARK: - Private Factory Methods
    
    private func makeNumericVolumeInputView() -> NumericInputView {
        let viewModel = NumericInputViewModel(placeHolderText: viewModel.setVolumePlaceHolderText,
                                              buttonText: viewModel.setVolumeButtonText,
                                              completion: viewModel.setVolumeHandler)
        return NumericInputView(viewModel: viewModel)
    }
    
    private func makeNumericLineInputView() -> NumericInputView {
        let viewModel = NumericInputViewModel(placeHolderText: viewModel.setLinePlaceHolderText,
                                              buttonText: viewModel.setLineButtonText,
                                              completion: viewModel.setLineHandler)
        return NumericInputView(viewModel: viewModel)
    }
}

// MARK: View Preview

#Preview {
    let viewModel = VolumeInputViewModel(setVolumeHandler: { _ in }, setLineHandler: { _ in })
    return VolumeInputView(viewModel: viewModel)
}
