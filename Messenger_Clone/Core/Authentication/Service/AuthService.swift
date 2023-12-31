//
//  AuthService.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 27/12/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUser()
        print("User session id is \(String(describing: userSession?.uid))")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUser()
        } catch {
            print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(withEmail: email, fullname: fullname, id: result.user.uid)
            loadCurrentUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signOut() {
        do {
            try Auth.auth().signOut() // Sign out on the back end
            self.userSession = nil // Update routing logic
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: Error to sign out with error \(error.localizedDescription)")
        }
    }
    
    
    private func uploadUserData(withEmail email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUser() {
        Task { try await UserService.shared.fetchCurrentUser() }
    }
}
