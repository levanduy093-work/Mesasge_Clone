//
//  InboxService.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 02/01/2024.
//

import Foundation
import Firebase

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else  { return }
        
        let query = FirestoreConstants.MessagesCollection.document(uid).collection("recent-messages").order(by: "timestamp", descending: false)
                
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else { return }
            
            self.documentChanges = changes
        }
    }
}

