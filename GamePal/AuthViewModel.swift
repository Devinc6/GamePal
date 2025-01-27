import SwiftUI
import Supabase

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var errorMessage: String?
    
    func signIn(email: String, password: String) async {
        do {
            let response = try await supabase.auth.signIn(
                email: email,
                password: password
            )
            await MainActor.run {
                if response.user != nil {
                    self.isAuthenticated = true
                    self.errorMessage = nil
                }
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isAuthenticated = false
            }
        }
    }
    
    func signUp(email: String, password: String) async {
        do {
            let response = try await supabase.auth.signUp(
                email: email,
                password: password
            )
            await MainActor.run {
                if response.user != nil {
                    self.isAuthenticated = true
                    self.errorMessage = nil
                }
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isAuthenticated = false
            }
        }
    }
    
    func signOut() async {
        do {
            try await supabase.auth.signOut()
            await MainActor.run {
                self.isAuthenticated = false
                self.currentUser = nil
                self.errorMessage = nil
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
            }
        }
    }
} 