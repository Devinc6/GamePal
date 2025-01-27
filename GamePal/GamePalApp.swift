//
//  GamePalApp.swift
//  GamePal
//
//  Created by Devin Cassella on 1/24/25.
//

import SwiftUI

@main
struct GamePalApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
