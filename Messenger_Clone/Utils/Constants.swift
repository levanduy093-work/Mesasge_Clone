//
//  Constants.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 02/01/2024.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}


