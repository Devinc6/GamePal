import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to yanks")
                    .font(.title)
                    .padding()
                
                // Add your main content here
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
} 
