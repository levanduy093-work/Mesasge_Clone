//
//  User.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 19/12/2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_USER = User(fullname: " Le Duy", email: "levanduy@gmail.com", profileImageUrl: "avatar")
}
