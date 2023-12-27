//
//  ContentViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 27/12/2023.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [ weak self ] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellable)
    }
}
