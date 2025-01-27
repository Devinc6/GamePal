//
//  AppView.swift
//  GamePal
//
//  Created by Devin Cassella on 1/24/25.
//

import SwiftUI

struct AppView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                ContentView()
                    .environmentObject(authViewModel)
            } else {
                AuthView()
                    .environmentObject(authViewModel)
            }
        }
        .task {
            for await state in supabase.auth.authStateChanges {
                await MainActor.run {
                    authViewModel.isAuthenticated = state.session != nil
                }
            }
        }
    }
}

#Preview {
    AppView()
}
