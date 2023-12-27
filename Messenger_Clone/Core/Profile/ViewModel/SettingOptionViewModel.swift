//
//  SettingOptionViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 19/12/2023.
//

import SwiftUI

enum SettingOptionViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notification
    
    var title: String {
        switch self {
        case .darkMode:
            return "Dark Mode"
        case .activeStatus:
            return "Active status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy"
        case .notification:
            return "Notification"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notification:
            return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
            
        case .darkMode:
            return .black
        case .activeStatus:
            return Color(.systemGreen)
        case .accessibility:
            return .black
        case .privacy:
            return Color(.systemBlue)
        case .notification:
            return Color(.systemPurple)
        }
    }
    
    var id: Int { return self.rawValue }
}
