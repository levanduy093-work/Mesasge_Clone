//
//  ChatViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 31/12/2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
