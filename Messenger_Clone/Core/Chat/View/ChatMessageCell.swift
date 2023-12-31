//
//  ChatMessageCell.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 27/12/2023.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
     
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text("This is a text test for now, this is a longer message let me see what happens")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                HStack(alignment: .bottom) {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    
                    Text("This is a text test for now, this is a longer message let me see what happens")                        .font(.subheadline)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: true)
}