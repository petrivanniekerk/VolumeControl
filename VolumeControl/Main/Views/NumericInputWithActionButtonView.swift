//
//  NumericInputWithActionButtonView.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import SwiftUI

struct NumericInputWithActionButtonView: View {
    
    // MARK: - Private Properties

    @StateObject private var viewModel: NumericInputWithActionButtonViewModel
    @FocusState private var volumeFieldIsFocused: Bool
    
    // MARK: - Initialiser
    
    init(viewModel: NumericInputWithActionButtonViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            TextField(viewModel.placeHolderText, text: $viewModel.input)
                .keyboardType(.numberPad)
                .focused($volumeFieldIsFocused)
                .padding()
                .frame(width: 250)
            Button {
                volumeFieldIsFocused = false
                viewModel.buttonPress()
            } label: {
                Text(viewModel.buttonText)
                    .padding(8)
                    .foregroundColor(.black)
                    .background(Color.gray.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
            }
        }
        .textFieldStyle(.roundedBorder)
        .alert("Invalid input", isPresented: $viewModel.showError, actions: {
            Button("OK", role: .cancel, action: {})
        }, message: {
            Text("Please enter numeric values only.")
        })
    }
}

// MARK: - Preview

#Preview {
    let viewModel = NumericInputWithActionButtonViewModel(placeHolderText: "Placeholder",
                                                          buttonText: "Button",
                                                          completion: { _ in })
    return NumericInputWithActionButtonView(viewModel: viewModel)
}
