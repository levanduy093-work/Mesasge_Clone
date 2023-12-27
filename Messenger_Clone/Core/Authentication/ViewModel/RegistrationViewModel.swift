//
//  RegistrationViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 27/12/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
