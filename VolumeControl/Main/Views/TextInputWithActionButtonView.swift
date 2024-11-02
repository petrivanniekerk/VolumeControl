//
//  TextInputWithActionButtonView.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import SwiftUI

struct TextInputWithActionButtonView: View {
    
    // MARK: - Private Properties
    
    private let buttonAction: (String) -> Void
    private let placeHolderText: String
    private let buttonText: String
    
    @State private var inputText: String
    @FocusState private var volumeFieldIsFocused: Bool
    
    // MARK: - Initialiser
    
    init(placeHolderText: String,
         buttonText: String,
         inputText: String,
         volumeFieldIsFocused: Bool,
         buttonAction: @escaping (String) -> Void) {
        self.placeHolderText = placeHolderText
        self.buttonText = buttonText
        self.buttonAction = buttonAction
        self.inputText = inputText
        self.volumeFieldIsFocused = volumeFieldIsFocused
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            TextField(placeHolderText, text: $inputText)
                .keyboardType(.numberPad)
                .focused($volumeFieldIsFocused)
                .padding()
            Button {
                volumeFieldIsFocused = false
                buttonAction(inputText)
                inputText = ""
            } label: {
                Text(buttonText)
                    .padding(8)
                    .foregroundColor(.black)
                    .background(Color.gray.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
            }
        }
        .textFieldStyle(.roundedBorder)
    }
}

// MARK: - Preview

#Preview {
    TextInputWithActionButtonView(placeHolderText: "Placeholder",
                                  buttonText: "Button",
                                  inputText: "",
                                  volumeFieldIsFocused: false) { _ in }
}
