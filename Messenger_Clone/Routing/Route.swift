//
//  Route.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 03/01/2024.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
