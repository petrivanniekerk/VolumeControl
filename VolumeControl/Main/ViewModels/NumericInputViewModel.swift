//
//  NumericInputViewModel.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 02/11/2024.
//

import Foundation

final class NumericInputViewModel: ObservableObject {
    
    // MARK: - Private Properties
    
    private let completion: (Int) -> Void
    
    // MARK: - Internal Properties
    
    let placeHolderText: String
    let buttonText: String
    
    @Published var input: String = ""
    @Published var showError = false
    
    // MARK: - Initialiser
    
    init(placeHolderText: String, buttonText: String, completion: @escaping (Int) -> Void) {
        self.completion = completion
        self.placeHolderText = placeHolderText
        self.buttonText = buttonText
    }
    
    // MARK: - Internal Methods
    
    func buttonPress() {
        if input.isEmpty { return }
        
        let filteredInput = input.filter { $0.isNumber }
        guard let number = Int(filteredInput) else {
            showError = true
            return
        }
        completion(number)
        input = ""
    }
}
