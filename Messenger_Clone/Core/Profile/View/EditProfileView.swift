//
//  EditProfileView.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 05/01/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    Task {
                        dismiss()
                        try await viewModel.updateUserData()
                        try await UserService.shared.fetchCurrentUser()
                    }
                }, label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                })
            }
            .padding(.horizontal)
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack(spacing: 10) {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .xLarge)
                    }
                    
                    Text("Edit profile image")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            HStack {
                Text("Name")
                    .padding(.leading, 8)
                    .frame(width: 100, alignment: .leading)
                
                VStack {
                    TextField("Enter your full name", text: $viewModel.fullname)
                        .autocapitalization(.words)
                        .autocorrectionDisabled()

                    Divider()
                }
            }
            .font(.subheadline)
            .frame(height: 36)
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER)
}
