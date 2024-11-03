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
    let maximumValue: Int?
    let customErrorMessage: String?
    
    @Published var input: String = ""
    @Published var showError = false
    
    // MARK: - Initialiser
    
    init(placeHolderText: String,
         buttonText: String,
         maximumValue: Int? = nil,
         customErrorMessage: String? = nil,
         completion: @escaping (Int) -> Void) {
        self.completion = completion
        self.placeHolderText = placeHolderText
        self.buttonText = buttonText
        self.maximumValue = maximumValue
        self.customErrorMessage = customErrorMessage
    }
    
    // MARK: - Internal Methods
    
    func buttonPress() {
        if input.isEmpty { return }
        
        let filteredInput = input.filter { $0.isNumber }
        guard let number = Int(filteredInput), !inputExceedsMax(number) else {
            showError = true
            input = ""
            return
        }
        completion(number)
        input = ""
    }
    
    // MARK: - Private Methods
    
    private func inputExceedsMax(_ input: Int) -> Bool {
        if let maximumValue {
            return input > maximumValue
        } else {
            return false
        }
    }
}
