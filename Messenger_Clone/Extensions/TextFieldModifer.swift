//
//  TextFieldModifer.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 18/12/2023.
//

import SwiftUI

struct TextFieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
