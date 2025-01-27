//
//  AuthView.swift
//  GamePal
//
//  Created by Devin Cassella on 1/24/25.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSignUp = false
    @State private var isLoading = false
    @State private var errorMessage: String?
    
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
                
                // Form Fields
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    if isSignUp {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                .padding(.horizontal)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }
                
                // Main Action Button
                Button(action: {
                    handleAuthAction()
                }) {
                    HStack {
                        Text(isSignUp ? "Sign Up" : "Sign In")
                        if isLoading {
                            ProgressView()
                                .tint(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(isLoading)
                
                // Toggle Sign In/Sign Up
                Button(action: {
                    isSignUp.toggle()
                    errorMessage = nil
                }) {
                    Text(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                        .foregroundColor(.blue)
                }
                
                // Forgot Password
                if !isSignUp {
                    Button("Forgot Password?") {
                        handleForgotPassword()
                    }
                    .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
    
    private func handleAuthAction() {
        // Input validation
        guard !email.isEmpty else {
            errorMessage = "Please enter your email"
            return
        }
        
        guard !password.isEmpty else {
            errorMessage = "Please enter your password"
            return
        }
        
        if isSignUp {
            guard password == confirmPassword else {
                errorMessage = "Passwords do not match"
                return
            }
            
            guard password.count >= 6 else {
                errorMessage = "Password must be at least 6 characters"
                return
            }
        }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            if isSignUp {
                await authViewModel.signUp(email: email, password: password)
            } else {
                await authViewModel.signIn(email: email, password: password)
            }
            isLoading = false
        }
    }
    
    private func handleForgotPassword() {
        guard !email.isEmpty else {
            errorMessage = "Please enter your email first"
            return
        }
        
        // Simulate password reset request
        isLoading = true
        errorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            errorMessage = "Password reset link sent to your email"
        }
    }
}

#Preview {
    AuthView()
}
