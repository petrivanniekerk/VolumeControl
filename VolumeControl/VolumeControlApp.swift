//
//  VolumeControlApp.swift
//  VolumeControl
//
//  Created by Petri van Niekerk on 31/10/2024.
//

import SwiftUI

@main
struct VolumeControlApp: App {
    var body: some Scene {
        WindowGroup {
            VolumeControllerView(viewModel: VolumeControllerViewModel())
        }
    }
}
