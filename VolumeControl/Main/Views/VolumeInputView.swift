//
//  VolumeInputView.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 01/11/2024.
//

import SwiftUI

struct VolumeInputView: View {
    
    // MARK: - Private Properties
    
    private let setVolumeButtonText = "Set Volume"
    private let setVolumePlaceHolderText = "Enter range 0 - 100"
    
    private let setLinesButtonText = "Set Lines"
    private let setLinesPlaceHolderText = "Enter range 0 - 10"
    
    private let setVolumeHandler: (String) -> Void
    private let setLinesHandler: (String) -> Void
    
    @FocusState private var volumeFieldIsFocused: Bool
    @State private var inputText: String = ""
    @State private var inputText2: String = ""
    
    // MARK: - Initialiser
    
    init(setVolumeHandler: @escaping (String) -> Void, setLinesHandler: @escaping (String) -> Void) {
        self.setVolumeHandler = setVolumeHandler
        self.setLinesHandler = setLinesHandler
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            TextInputWithActionButtonView(placeHolderText: setVolumePlaceHolderText,
                                          buttonText: setVolumeButtonText,
                                          inputText: inputText,
                                          volumeFieldIsFocused: volumeFieldIsFocused,
                                          buttonAction: setVolumeHandler)
            TextInputWithActionButtonView(placeHolderText: setLinesPlaceHolderText,
                                          buttonText: setLinesButtonText,
                                          inputText: inputText2,
                                          volumeFieldIsFocused: volumeFieldIsFocused,
                                          buttonAction: setLinesHandler)
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
}

// MARK: View Preview

#Preview {
    VolumeInputView(setVolumeHandler: { _ in }, setLinesHandler: { _ in })
}
