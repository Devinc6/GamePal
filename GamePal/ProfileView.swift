//
//  ProfileView.swift
//  GamePal
//
//  Created by Devin Cassella on 1/24/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Profile Image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding()
                
                // Profile Info
                List {
                    Section(header: Text("Personal Info")) {
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("John Doe")
                        }
                        
                        HStack {
                            Text("Email")
                            Spacer()
                            Text("john@example.com")
                        }
                    }
                    
                    Section(header: Text("Settings")) {
                        NavigationLink(destination: Text("Edit Profile")) {
                            Text("Edit Profile")
                        }
                        
                        NavigationLink(destination: Text("Privacy Settings")) {
                            Text("Privacy")
                        }
                        
                        NavigationLink(destination: Text("Notifications")) {
                            Text("Notifications")
                        }
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
