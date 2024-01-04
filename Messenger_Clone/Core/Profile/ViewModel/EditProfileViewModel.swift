//
//  EditProfileViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 04/01/2024.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var profileImage: Image?
    @Published var fullname = ""
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            if let selectedImage = selectedImage {
                Task {
                    await loadImage(fromItem: selectedImage)
                    try await updateUserData()
                }
            }
        }
    }
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    // Upload user data
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !data.isEmpty {
            try await FirestoreConstants.UserCollection.document(user.id).updateData(data)
        }
    }
}
