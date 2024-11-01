//
//  VolumeInputView.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 01/11/2024.
//

import SwiftUI

struct VolumeInputView: View {
    
    // MARK: - Private Properties
    
    private var buttonAction: (String) -> Void
    
    @FocusState private var volumeFieldIsFocused: Bool
    @State private var inputText: String = ""
    
    // MARK: - Initialiser
    
    init(buttonAction: @escaping (String) -> Void) {
        self.buttonAction = buttonAction
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter range 0 - 100", text: $inputText)
                    .keyboardType(.numberPad)
                    .focused($volumeFieldIsFocused)
                    .padding()
                Button {
                    volumeFieldIsFocused = false
                    buttonAction(inputText)
                    inputText = ""
                } label: {
                    Text("Set Volume")
                        .padding(8)
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
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
}

// MARK: View Preview

#Preview {
    VolumeInputView(buttonAction: { _ in })
}
