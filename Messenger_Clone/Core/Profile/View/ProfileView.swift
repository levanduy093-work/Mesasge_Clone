//
//  ProfileView.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 19/12/2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            // header
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(.systemGray4))
                            .clipShape(.circle)
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            // List
            List {
                Section {
                    ForEach(SettingOptionViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                    Button {
                        print("Delete Account Action")
                    } label: {
                        Text("Delete Account")
                    }
                }
                .foregroundColor(Color(.red))

            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}
