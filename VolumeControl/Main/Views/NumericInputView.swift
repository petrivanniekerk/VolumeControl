//
//  NumericInputView.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import SwiftUI

struct NumericInputView: View {
    
    // MARK: - Private Properties

    @StateObject private var viewModel: NumericInputViewModel
    @FocusState private var textFieldIsFocused: Bool
    
    // MARK: - Initialiser
    
    init(viewModel: NumericInputViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            TextField(viewModel.placeHolderText, text: $viewModel.input)
                .keyboardType(.numberPad)
                .focused($textFieldIsFocused)
                .padding()
                .frame(width: 250)
            Button {
                textFieldIsFocused = false
                viewModel.buttonPress()
            } label: {
                Text(viewModel.buttonText)
                    .frame(width: 100)
                    .padding(8)
                    .foregroundColor(.black)
                    .background(Color.gray.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
            }
        }
        .textFieldStyle(.roundedBorder)
        .alert("Invalid input", isPresented: $viewModel.showError, actions: {
            Button("OK", role: .cancel, action: {})
        }, message: {
            Text(viewModel.customErrorMessage ?? "Please enter valid value.")
        })
    }
}

// MARK: - Preview

#Preview {
    let viewModel = NumericInputViewModel(placeHolderText: "Placeholder",
                                          buttonText: "Button", 
                                          minimumValue: 0,
                                          maximumValue: 10,
                                          completion: { _ in })
    return NumericInputView(viewModel: viewModel)
}
