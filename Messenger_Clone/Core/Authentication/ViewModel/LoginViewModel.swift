//
//  LoginViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 27/12/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
