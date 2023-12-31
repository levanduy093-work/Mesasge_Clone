//
//  NewMessageViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 31/12/2023.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUser() }
    }
    
    func fetchUser() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.uid != currentUid })
    }
}
