//
//  ContentView.swift
//  GamePal
//
//  Created by Devin Cassella on 1/24/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if authViewModel.isAuthenticated {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                HealthView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Health")
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        } else {
            AuthView()
        }
    }
}

#Preview {
    ContentView()
}
