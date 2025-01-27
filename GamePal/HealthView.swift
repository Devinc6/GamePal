import SwiftUI

struct HealthView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .padding()
                
                Text("Health Stats")
                    .font(.title)
                    .padding()
                
                // Placeholder for health content
                List {
                    Section(header: Text("Daily Stats")) {
                        HStack {
                            Image(systemName: "flame.fill")
                            Text("Activity")
                            Spacer()
                            Text("0 min")
                        }
                        
                        HStack {
                            Image(systemName: "bed.double.fill")
                            Text("Sleep")
                            Spacer()
                            Text("0 hrs")
                        }
                    }
                }
            }
            .navigationTitle("Health")
        }
    }
}

#Preview {
    HealthView()
} 