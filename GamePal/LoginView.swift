import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Logo and Title
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.top, 50)
                
                Text("GamePal")
                    .font(.largeTitle)
                    .bold()
                
                // Login Form
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                // Login Button
                Button(action: {
                    // Add login action here
                }) {
                    Text("Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Sign Up Button
                Button(action: {
                    // Add sign up action here
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Forgot Password
                Button("Forgot Password?") {
                    // Add forgot password action here
                }
                .foregroundColor(.gray)
                .padding(.top)
                
                Spacer()
            }
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LoginView()
} 