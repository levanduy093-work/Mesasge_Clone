//
//  InboxViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 30/12/2023.
//

import Foundation
import Combine
import Firebase

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] userFromUserService in
            self?.currentUser = userFromUserService
        }.store(in: &cancellable)
    }
}
