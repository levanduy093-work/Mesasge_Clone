//
//  InboxRowView.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 19/12/2023.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundStyle(Color(.systemGray4))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Le Duy")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test message for me")
                    .font(.subheadline)
                    .foregroundStyle(Color(.gray))
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
