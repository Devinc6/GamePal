import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink("Edit Profile") {
                        Text("Edit Profile View")
                    }
                    NavigationLink("Notifications") {
                        Text("Notifications View")
                    }
                }
                
                Section(header: Text("App")) {
                    NavigationLink("About") {
                        Text("About View")
                    }
                    NavigationLink("Help") {
                        Text("Help View")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
} 